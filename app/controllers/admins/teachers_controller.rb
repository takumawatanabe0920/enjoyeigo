class Admins::TeachersController < ApplicationController
  layout "admin"
  before_action :find_teacher, only: [:show, :edit, :update]
  before_action :authenticate_admin!
  def show
  end

  def edit
  end

  def update
    if @teacher.update_attributes(teacher_params)
      flash[:success] = "Profile updated"
      redirect_to admins_root_path
    else
      render 'edit'
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy!
    flash[:now] = "先生が削除されました。"
    redirect_back(fallback_location: admins_root_path)
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :zip, :addr, :pref, :prefecture, :line, :station)
  end
end
