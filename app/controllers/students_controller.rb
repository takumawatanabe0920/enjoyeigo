class StudentsController < ApplicationController
require "pry"

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
    @permiters = current_student.permiters.page(params[:page])
    @message = Message.new
    @teacher = Teacher.find(params[:id])
    @messages =  @teacher.messages
    


    #@studentRoom = Room.where(student_id: current_student.id)
    #@teacherRoom = Room.where(teacher_id: @permiter.id)
    #@studentRoom.each do |sr|
      #@teacherRoom.each do |t|
        #if sr.id == t.id then
          #@isRoom = true
          #@roomId = sr.id
        #end
      #end
    #end
    #if @isRoom
    #else
      #@room = Room.new
    #end
  end
end
