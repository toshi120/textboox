# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  def students_guest_sign_in
    student = Student.students_guest
    sign_in student
    redirect_to students_textbooks_path
  end
end
