class StudentsController < ApplicationController
require "pry"

  def show
    @student = Student.find(params[:id])
    @requests = @student.requests.order('created_at DESC').page(params[:page])
  end

  def requestings

    @requestings = current_student.requestings.page(params[:page])
    
  end

  def permiters
    @permiters = current_student.permiters.page(params[:page])
    @message = Message.new
    @messages = Message.where(student_id: current_student.id)
  end
end
