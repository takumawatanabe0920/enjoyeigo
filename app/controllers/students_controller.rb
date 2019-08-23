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
  end
end
