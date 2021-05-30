class TeachersController < Teachers::ApplicationController
before_action :set_teacher
before_action :block_access


  def show
    @name = @teacher.name
    @my_textbooks = Textbook.where(teacher_id: @teacher.id)
  end

  private

  def block_access
    if current_teacher != @teacher
      redirect_to teachers_textbooks_path
    end
  end

  def set_teacher
    @teacher= Teacher.find(params[:id])
  end
end
