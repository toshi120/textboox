class Students::StudentsTextbooksController < Students::ApplicationController
  before_action :set_textbook

  def create
    @students_textbook = StudentsTextbook.new(students_textbook_params)
    if @students_textbook.save
      redirect_to students_textbook_path(@textbook.id)
    else
      render students_textbook_path(@textbook.id)
    end
  end

  def destroy
    @found_recode = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)
    @found_recode.destroy
    redirect_to students_textbook_path(@textbook.id)
  end

  private

  def students_textbook_params
    params.permit(:students_textbook).merge(student_id: current_student.id, textbook_id: @textbook.id)
  end

  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end
end
