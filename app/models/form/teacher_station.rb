# app/models/form/teacher_station.rb
class Form::TeacherStation < TeacherStation
  REGISTRABLE_ATTRIBUTES = %i(id teacher_id station_id _destroy)

  def selectable_stations
    Station.all
  end
end
