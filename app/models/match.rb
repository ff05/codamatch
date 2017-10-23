class Match < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :student1, presence: true
  validates :student2, presence: true
end
