class Journal < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :name, presence: true
end
