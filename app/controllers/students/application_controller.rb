class Students::ApplicationController < ApplicationController
  layout 'students/application'
  before_action :authenticate_student!


end
