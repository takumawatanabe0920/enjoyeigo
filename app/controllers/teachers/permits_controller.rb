class Teachers::PermitsController < ApplicationController
  def create
    student = Student.find(params[:student_id])
    current_teacher.permit(student)
    flash[:success] = 'リクエストを承認しました'
    redirect_to teachers_root_path
  end

  def destroy
    student = Student.find(params[:student_id])
    current_teacher.reject(student)
    flash[:success] = 'リクエストを拒否しました'
    redirect_to teachers_root_path
  end
end
