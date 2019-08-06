class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  #has_one :station, dependent: :destroy
  has_one :address, dependent: :destroy


  has_many :relationships
  has_many :followings, through: :relationships, source: :student
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'student_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :teacher

  def follow(other_student)
    unless self == other_teacher
      self.relationships.find_or_create_by(student_id: other_teacher.id)
    end
  end

  def unfollow(other_student)
    relationship = self.relationships.find_by(student_id: other_teacher.id)
    relationship.destroy if relationship
  end

  def following?(other_student)
    self.followings.include?(other_student)
  end
end
