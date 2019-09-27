class Teachers::TeachersController < ApplicationController
  require "pry"
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
    @permits = current_teacher.permits.page(params[:page])
    @message = Message.new
    @teacher = current_teacher
    @sendmessages = current_teacher.reverses_of_message.order("created_time DESC")
    @receivemessages = Message.order("created_time DESC").where(teacher_id: current_teacher)
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
