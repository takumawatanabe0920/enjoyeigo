# app/models/form/teacher.rb
class Form::Teacher < Teacher
  REGISTRABLE_ATTRIBUTES = %i(id name email password password_confirmation )

  has_many :teacher_stations, class_name: 'Form::TeacherStation'
end
