class StudentsController < ApplicationController
before_action :block_access, only: [:show]

  def show
    student = Student.find(params[:id])
    @name = student.name
    @my_textbooks = StudentsTextbook.where(student_id: student.id)
  end

  private

  def block_access
    if current_student != student
      redirect_to students_textbooks_path
    end
  end
end
