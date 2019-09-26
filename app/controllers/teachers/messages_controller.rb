class Teachers::MessagesController < ApplicationController
  require "pry"

  def create
    @message = current_teacher.reverses_of_message.create(messages_params)
    binding.pry
    redirect_to teachers_root_path
  end

  private

  def messages_params
    params.require(:message).permit(:student_id, :message).merge(teacher_id: current_teacher.id)
  end
end
