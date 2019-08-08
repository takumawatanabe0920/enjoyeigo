class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :requests
  has_many :requestings, through: :requests, source: :teacher

  def request(teacher)
    self.requests.find_or_create_by(teacher_id: teacher.id)
  end

  def unrequest(teacher)
    request = self.requests.find_by(teacher_id: teacher.id)
    request.destroy if request
  end

  def requesting?(teacher)
    self.requestings.include?(teacher)
  end
end
