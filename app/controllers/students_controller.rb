class StudentsController < ApplicationController
  def show
    student = Student.find(params[:id])
    @name = student.name
    @my_textbooks = StudentsTextbook.where(student_id: student.id)
    binding.pry
  end
end
