class TimeRecord < ApplicationRecord
  belongs_to :user,  dependent: :destroy
  validates :user_id, presence: true
  validates :date, presence: true
end
