class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, entryable_id: current_student.id)
    logger.debug @entry1.errors.inspect
    @entry2 = Entry.create(params.require(:entry).permit(:entryable_id, :room_id, :entryable_type).merge(room_id: @room.id))
    logger.debug @entry2.inspect
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(entryable_id: current_student.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
