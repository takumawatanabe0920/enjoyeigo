class Admins::NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destory]
  def create
    @notification = current_admin.notifications.build(notification_params)
    if @notification.save
      flash[:success] = 'お知らせを投稿しました。'
      redirect_to admins_root_url
    else
      @notifications = current_admin.notifications.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'お知らせの投稿に失敗しました。'
      render 'admins/top/index'
    end
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    flash[:success] = 'お知らせを削除しました。'
    redirect_back(fallback_location: admins_root_path)
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :content)
  end
end
