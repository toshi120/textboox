class StudentsController < Students::ApplicationController
  before_action :set_student
  before_action :block_access
  def show
    @name = @student.name
    @my_textbooks = StudentsTextbook.where(student_id: @student.id)
  end

  private

  def block_access
    redirect_to students_textbooks_path if current_student != @student
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
