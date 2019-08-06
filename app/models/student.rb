class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :relationships
  has_many :followings, through: :relationships, source: :teacher
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'teacher_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :student

  def follow(other_teacher)
    unless self == other_student
      self.relationships.find_or_create_by(teacher_id: other_student.id)
    end
  end

  def unfollow(other_teacher)
    relationship = self.relationships.find_by(teacher_id: other_student.id)
    relationship.destroy if relationship
  end

  def following?(other_teacher)
    self.followings.include?(other_teacher)
  end
end
