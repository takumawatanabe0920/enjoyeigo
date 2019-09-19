class MessagesController < ApplicationController
  before_action :authenticate_student!, :only => [:create]

  def create
    if Entry.where(entryable_id: current_student.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(messages_params)
      logger.debug @message.errors.inspect
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def messages_params
    params.require(:message).permit(:messagable_id, :content, :room_id).merge(messagable_id: current_student.id)
  end
end
