class Teachers::ProfilesController < ApplicationController
  def index
    prefecture = Prefecture.find(params[:prefecture_id])
    station_line = Station(:prefecture_id).includes(:station_line).map {|s| s.station_line}
    render json: station_line.select(:id, :name)
    station = station_line.try(:station)
    render json: station.select(:id, :name)

  end

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
    @teacher.prefecture = Prefecture.new if @teacher.prefecture.blank?
    @teacher.station_line = StationLine.new if @teacher.station_line.blank?
    @teacher.station = Station.new if @teacher.station.blank?

  end

  def update
    @teacher.update(teacher_params)
    redirect_to teachers_root_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, address_attributes:[:id, :zip, :pref, :city, :addr], contact_attributes:[:id, :phonenumber, :mailaddress1, :mailaddress2, :phonecall], personalinfo_attributes:[:id, :national, :sex, :birthday], prefecture_attributes:[:id, :name],  station_line_attributes:[:id, :name], station_attributes:[:id, :name])
  end

end
