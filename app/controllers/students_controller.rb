class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @requests = @student.requests.order('created_at DESC').page(params[:page])
  end

  def requestings
    @student = Student.find(params[:id])
    @requestings = @student.requestings.page(params[:page])
    counts(@student)
  end

  def permiters
    @student = Student.find(params[:id])
    @permiters = @student.permiters.page(params[:page])
    @permiters.each {|permiter| @permiter.id = permiter.id }
    @currentStudentEntry = Entry.where(student_id: current_student.id)
    @teacherEntry = Entry.where(teacher_id: @permiter.id)
    @currentStudentEntry.each do |ct|
      @teacherEntry.each do |t|
        if ct.room_id == t.room_id then
          @isRoom = true
          @roomId = ct.room_id
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
end
