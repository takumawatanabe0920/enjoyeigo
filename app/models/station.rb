class Station < ApplicationRecord
  has_many :reverses_of_teacher_station ,class_name: "TeacherStation", foreign_key: 'station_id', dependent: :destroy
  has_many :teachers, through: :reverses_of_teacher_station, source: :teacher
end
