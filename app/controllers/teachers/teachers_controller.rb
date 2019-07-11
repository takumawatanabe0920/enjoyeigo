class Teachers::TeachersController < ApplicationController
  layout "teacher"
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
