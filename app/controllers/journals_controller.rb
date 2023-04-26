class JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show edit update destroy ]

  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.turbo_stream
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @journal.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@journal) }
    end
  end

  private

  def set_journal
    @journal = Journal.find(params[:id])
  end

  def journal_params
    params.require(:journal).permit(:name)
  end
end
