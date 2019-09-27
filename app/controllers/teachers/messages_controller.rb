class Teachers::MessagesController < ApplicationController
  require "pry"

  def create
    @message = current_teacher.reverses_of_message.create(messages_params)
    redirect_to permits_teachers_teacher_path(current_teacher)
  end

  private

  def messages_params
    params.require(:message).permit(:student_id, :message, :user_type).merge(teacher_id: current_teacher.id)
  end
end
