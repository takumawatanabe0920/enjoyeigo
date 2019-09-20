class RoomsController < ApplicationController
require "pry"
  def create
    @teacher = Teacher.find(params[:room][:teacher_id])
    @room = current_student.sroom(@teacher)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @rooms = current_student.srooms
    @ro = Room.all
    @room = @ro.find(params[:id])
    @message = Message.new
    @messages = current_student.smessages
  end
end
