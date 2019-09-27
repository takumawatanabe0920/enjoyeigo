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
    @sendmessages =  current_student.messages
    @receivemessages = Message.all.where(student_id: current_student.id)
  end
end
