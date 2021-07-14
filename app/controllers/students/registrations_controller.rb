# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  def ensure_normal_student
    redirect_to root_path if resouce.name == 'student_guest@example.com'
  end
end
