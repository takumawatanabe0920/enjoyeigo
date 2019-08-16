class Teachers::TeachersController < ApplicationController
  layout "teacher"
  def index
    @teachers = Teacher.all
    @notifications = Notification.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:success] = "プロフィールが変更されました"
      redirect_to @teacher
    else
      render 'edit'
    end
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
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :zip, :addr, :pref, :s0, :s1, :prefecture, :line, :station)
  end

end
