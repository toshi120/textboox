class TeachersController < ApplicationController

  def show
    teacher = Teacher.find(params[:id])
    @name = Teacher.name
    @my_textbooks = Textbook.where(teacher_id: teacher.id)
  end
end
