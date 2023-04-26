class Entry < ApplicationRecord
  belongs_to :journal

  validates :text, presence: true
end
