class Students::ApplicationController < ApplicationController
  layout 'students/application'
  before_action :authenticate_student!

  private 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: :name)
  end
   

end