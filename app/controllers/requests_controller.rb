class RequestsController < ApplicationController
  def create
    teacher = Teacher.find(params[:teacher_id])
    current_student.request(teacher)
    flash[:success] = 'リクエストを送りました。'
    redirect_to root_path
  end

  def destroy
    teacher = Teacher.find(params[:teacher_id])
    current_student.unrequest(teacher)
    flash[:success] = 'リクエストを取り消しました。'
    redirect_to root_path
  end


end
