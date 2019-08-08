class Teachers::TeachersController < ApplicationController
  layout "teacher"
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def requesters
    @student= Student.find(params[:id])
    @requesters = @student.requesters.page(params[:page])
  end


end
