class Students::ProgressesController < Students::ApplicationController
  before_action :set_textbook


  def new
   
    @students_textbook = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)  
    @progress = Progress.new
  end

  def create    
    @progress = Progress.new(progress_params)
    if @progress.save
      redirect_to students_textbook_path(@textbook)
    else
      @students_textbook = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)  

      @progresses = Progress.where(students_textbook_id: @students_textbook.id).order('created_at DESC')
      render template: "students/textbooks/show"
    end
  end

  private
  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end

  def progress_params
    params.require(:progress).permit(:progress_page, :comment).merge(students_textbook_id: params[:students_textbook_id])
  end
end
