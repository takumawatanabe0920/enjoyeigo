class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  #has_one :station, dependent: :destroy
  has_one :address, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :address
  has_one :contact, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :contact
  has_one :personalinfo, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :personalinfo
  has_one :prefecture, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :prefecture
  has_one :station_line, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :station_line
  has_one :station, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :station



  has_many :relationships, dependent: :destroy
  has_many :permits, through: :relationships, source: :student


  has_many :reverses_of_request, class_name: 'Request', foreign_key: 'teacher_id', dependent: :destroy
  has_many :requesters, through: :reverses_of_request, source: :student



  def permit(student)
    self.relationships.find_or_create_by(student_id: student.id)
  end

  def reject(student)
    relationship = self.reverses_of_request.find_by(student_id: student.id)
    relationship.destroy if relationship
  end

  def permits?(student)
    self.permits.include?(student)
  end

  def teacher_send_message(student, content)
    self.teacher_from_messages.create!(to_id: student.id, content: content)
  end



end
