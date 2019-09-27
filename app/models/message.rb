class Message < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates :message, presence: true
  validates :user_type, presence: true

end
