class EntriesController < ApplicationController
  before_action :set_journal, only: %i[new create edit show update destroy index]
  before_action :set_entry, only: %i[show update destroy edit]

  def new
    @entry = @journal.entries.build
  end

  def create
    @journal = Journal.find(params[:journal_id])
    @entry = @journal.entries.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @entry = @journal.entries.find(params[:id])
  end

  def update
    @entry = @journal.entries.find(params[:id])

    respond_to do |format|
      if @entry.update(entry_params)
        format.turbo_stream
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @entry.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@entry) }
    end
  end

  private

  def set_journal
    @journal = Journal.find(params[:journal_id])
  end

  def set_entry
    @entry = @journal.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:text)
  end
end
