class Admins::TopController < ApplicationController
  before_action :authenticate_admin!
  def index
    @students = Student.all.recent
    @teachers = Teacher.all.recent
  end

end
