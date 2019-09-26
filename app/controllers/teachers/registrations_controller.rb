# frozen_string_literal: true

class Teachers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @teacher = Teacher.new
     super
  end

 # POST /resource
  def create
   @teacher = Teacher.new(Teacher_params)

   if @teacher.save
     flash[:success] = "登録しました"
     redirect_to teachers_root_path
   else
     flash.now[:danger] = "登録に失敗しました"
     render :new
   end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:success] = "Profile updated"
      redirect_to admins_root_path
    else
      render 'edit'
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name,  :email, :password, :password_confirmation)
  end
end
