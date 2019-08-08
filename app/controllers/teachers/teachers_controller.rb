class Teachers::TeachersController < ApplicationController
  layout "teacher"
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def requesters
    @teacher = Teacher.find(params[:id])
    @requesters = @teacher.requesters.page(params[:page])
    counts(@teacher)
  end


end
