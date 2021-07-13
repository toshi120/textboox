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
      if @progresses == []
        @progress_percent = 0
      else
        @last_progress = @progresses.first
        @progress_percent_nofloor = @last_progress.progress_page / @textbook.page.to_f * 100
        @progress_percent = @progress_percent_nofloor.floor
      end
      render template: 'students/textbooks/show'
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
