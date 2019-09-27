class MessagesController < ApplicationController
  require "pry"
  before_action :authenticate_student!, :only => [:create]

  def create
    @message = current_student.messages.create(messages_params)
    redirect_to permiters_student_path(current_student)
  end

  private
  def messages_params
    params.require(:message).permit(:teacher_id, :message, :user_type).merge(student_id: current_student.id)
  end
end
