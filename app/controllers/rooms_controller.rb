class RoomsController < ApplicationController
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, student_id: current_student.id)
    @entry2 = Entry.create(rooms_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(student_id: current_student.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def rooms_params
    params.require(:entry).permit(:teacher_id, :room_id).merge(room_id: @room.id))
  end
end
