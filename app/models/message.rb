class Message < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates :message, presence: true
  validates :user_type, presence: true

  def message_type?(teacher)
    self.where(:user_type => "Teacher", :teacher_id => teacher.id)
  end

  scope :sreceivetype, ->(teacher) { where(user_type: "Teacher")}
  scope :smessagesid, ->(teacher) { where(teacher_id: teacher.id)}

end
