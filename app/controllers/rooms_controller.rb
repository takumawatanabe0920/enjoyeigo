class RoomsController < ApplicationController

  def create
    teachers = current_student.permiters
    teacher = teachers.find(params[:id])
    @room = current_student.sroom(teacher.id)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    #@messages = @room.messages
  end
end
