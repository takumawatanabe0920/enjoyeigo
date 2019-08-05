class Admins::TopController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  def index
    @students = Student.all.recent
    @teachers = Teacher.all.recent
    @notification = current_admin.notifications.build  # form_for 用
    @notifications = current_admin.notifications.order('created_at DESC').page(params[:page])
  end

end
