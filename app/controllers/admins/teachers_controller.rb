class Admins::TeachersController < ApplicationController
  layout "admin"
  before_action :find_teacher, only: [:show, :edit]
  before_action :authenticate_admin!
  def show
  end

  def edit
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
end
