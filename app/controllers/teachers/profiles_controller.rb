class Teachers::ProfilesController < ApplicationController
  def new
    #@teacher = Teacher.new
    #@teacher.build_contact
  end

  def create
    #@teacher = Teacher.new(teacher_params)
    #@teacher.save
    #redirect_to teachers_teacher_path(@teacher)
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @teacher.contact = Contact.new if @teacher.contact.blank?
    @teacher.address = Address.new if @teacher.address.blank?
    @teacher.personalinfo = Personalinfo.new if @teacher.personalinfo.blank?
    @teacherstation = Form::Teacher.new if @teacherstation.blank?
  end

  def update
    @teacherstation = Form::Teacher.new if @teacherstation.blank?
    @teacher.update(teacher_params)
    @teacherstation.update(teacher_station_params)
    redirect_to teachers_teacher_path(@teacher)
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, address_attributes:[:id, :zip, :pref, :city, :addr], contact_attributes:[:id, :phonenumber, :mailaddress1, :mailaddress2, :phonecall], personalinfo_attributes:[:id, :national, :sex, :birthday], teacher_station_attributes:[:id, :teacher_id, :station_id])
  end

  def teacher_station_params
    params.require(:form_teacher).permit(Form::Teacher::REGISTRABLE_ATTRIBUTES +
    [teacher_stations_attributes: Form::TeacherStation::REGISTRABLE_ATTRIBUTES]
      )
  end
end
