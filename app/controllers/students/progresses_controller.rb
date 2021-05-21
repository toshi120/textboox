class Students::ProgressesController < Students::ApplicationController

  def new
    @textbook = Textbook.find(params[:textbook_id])
    @students_textbook = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)  
    @progress = Progress.new
  end

  def create
    @textbook = Textbook.find(params[:textbook_id]) 
    @progress = Progress.new(progress_params)
    if @progress.save
      redirect_to students_textbooks_path(@textbook)
    else
      render :new
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:progress_page, :comment).merge(students_textbook_id: params[:students_textbook_id])
  end
end
