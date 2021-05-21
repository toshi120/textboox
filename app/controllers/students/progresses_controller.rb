class Students::ProgressesController < Students::ApplicationController

  def new
    @textbook = Textbook.find(params[:textbook_id])
    @found_recode = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)  
    @progress = Progress.new
  end

  def create
    
  end
end
