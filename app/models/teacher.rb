class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  #has_one :station, dependent: :destroy
  has_one :address, dependent: :destroy


  has_many :requests
  has_many :permits, through: :requests, source: :student
  has_many :reverses_of_request, class_name: 'Request', foreign_key: 'teacher_id'
  has_many :requesters, through: :reverses_of_relationship, source: :student

  def permit(student)
    self.requests.find_or_create_by(student_id: student.id)
  end

  def reject(teacher)
    request = self.requests.find_by(student_id: student.id)
    request.destroy if request
  end
end
