class Admins::StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :destroy]
  before_action :authenticate_admin!
  def show
    student = Student.find(params[:id])
    redirect_to [:edit, :admin, student]
  end

  def edit
  end

  def destroy
    @student.destroy
    flash[:success] = '生徒を削除しました。'
    redirect_back(fallback_location: admin_students_path)
  end

  private
  def find_student
    @student = Student.find(params[:id])
  end
end
