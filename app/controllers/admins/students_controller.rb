class Admins::StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit]
  before_action :authenticate_admin!
  def show
  end

  def edit
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
end
