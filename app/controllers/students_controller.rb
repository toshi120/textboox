class StudentsController < ApplicationController
before_action :set_student  
before_action :block_access
  def show
    @name = @student.name
    @my_textbooks = StudentsTextbook.where(student_id: @student.id)
  end

  private

  def block_access
    if current_student != @student
      redirect_to students_textbooks_path
    end
  end

  def set_student
    @student= Student.find(params[:id])
  end
end
