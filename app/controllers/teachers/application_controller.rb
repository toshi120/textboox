class Teachers::ApplicationController < ApplicationController
  layout 'teachers/application'
  before_action :authenticate_teacher!
end
