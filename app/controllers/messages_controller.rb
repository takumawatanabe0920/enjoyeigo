class MessagesController < ApplicationController
  require "pry"
  before_action :authenticate_student!, :only => [:create]

  def create
    @message = current_student.messages.create(messages_params)
    redirect_to root_path
  end

  private
  def messages_params
    params.require(:message).permit(:teacher_id, :message).merge(student_id: current_student.id)
  end
end
