class Teachers::ProfilesController < ApplicationController
  def new
    @teacher = Teacher.new
    @teacher.build_contact
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    redirect_to teachers_teacher_path(@teacher)
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @teacher.contact = Contact.new if @teacher.contact.blank?
    @teacher.address = Address.new if @teacher.address.blank?
    @teacher.personalinfo = Personalinfo.new if @teacher.personalinfo.blank?

  end

  def update
    @teacher.update(teacher_params)
    redirect_to teachers_teacher_path(@teacher)
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, address_attributes:[:id, :zip, :pref, :city, :addr], contact_attributes:[:id, :phonenumber, :mailaddress1, :mailaddress2, :phonecall], personalinfo_attributes:[:id, :national, :sex, :birthday])
  end
end
