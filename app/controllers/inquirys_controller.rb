class InquirysController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => "confirm"
    else
      render :action => "index"
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver

    render :action => "thanks"
  end


  private
  def inquiry_params
    params.require(:inquiry).permit(:name ,:email, :content, :phone)
  end
end
