class ToppagesController < ApplicationController
  require "pry"
  def index
    @teachers = Teacher.all
    @notifications = Notification.all
  end
end
