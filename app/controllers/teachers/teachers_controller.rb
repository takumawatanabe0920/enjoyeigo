class Teachers::TeachersController < ApplicationController
  layout "teacher"
  before_action :not_access, except:[:index,:show]


  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
  end

  def update
  end

  def requesters
    @teacher = Teacher.find(params[:id])
    @requesters = @teacher.requesters.page(params[:page])
  end

  def permits
    @teacher = Teacher.find(params[:id])
    @permits = @teacher.permits.page(params[:page])
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
  end

  def not_access
    if current_student
      redirect_to root_path
    end
  end


end
