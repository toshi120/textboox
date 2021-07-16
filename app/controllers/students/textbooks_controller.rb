class Students::TextbooksController < Students::ApplicationController
  before_action :set_textbook, only: [:show]

  def index
    @textbooks = Textbook.all.order('created_at DESC')
  end

  def show
    @progress = Progress.new
    @students_textbook = StudentsTextbook.where(student_id: current_student.id).find_by(textbook_id: @textbook.id)
    unless @students_textbook.nil?
      @progresses = Progress.where(students_textbook_id: @students_textbook.id).order('created_at DESC')
      if @progresses == []
        @progress_percent = 0
      else
        @last_progress = @progresses.first
        @progress_percent_nofloor = @last_progress.progress_page / @textbook.page.to_f * 100
        @progress_percent = @progress_percent_nofloor.floor
      end
    end
  end

  private

  def set_textbook
    @textbook = Textbook.find(params[:id])
  end
end
