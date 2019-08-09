class ToppagesController < ApplicationController
  def index
    @teachers = Teacher.all.recent
    @notifications = Notification.all
  end
end
