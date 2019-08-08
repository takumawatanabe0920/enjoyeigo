class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #def counts(student)
    #@count_requestings = student.requestings.count
  #end

  #def counts(teacher)
    #@count_requesters = teacher.requesters.count
  #end

  def after_sign_in_path_for(resource)
    if current_teacher
      teachers_root_path
    elsif current_student
      root_path
    elsif current_admin
      admins_root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

 def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :zip, :addr, :pref, :prefecture, :line, :station]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
