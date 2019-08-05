class Admins::StudentsController < ApplicationController
  layout "admin"
  before_action :find_student, only: [:show, :edit, :update]
  before_action :authenticate_admin!
  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(student_params)
      flash[:success] = "Profile updated"
      redirect_to admins_root_path
    else
      render "edit"
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    flash[:success] = '生徒を削除しました。'
    redirect_back(fallback_location: admins_root_path)
  end

  private
  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
