class Teachers::TextbooksController < Teachers::ApplicationController
  before_action :set_teachers_textbook, only: %i[show edit update destroy search]

  def index
    @teachers_textbooks = Textbook.all.order('created_at DESC')
  end

  def show
    @students_textbook = StudentsTextbook.where(textbook_id: @teachers_textbook.id)
    @studying_students = StudentsTextbook.where(textbook_id: @teachers_textbook.id)
    n = 0
    @students = []
    @studying_students.length.times do
      @students << @studying_students[n].student
      n += 1
    end
  end

  def new
    @teachers_textbook = Textbook.new
  end

  def edit
  end

  def create
    @teachers_textbook = Textbook.new(teachers_textbook_params)

    respond_to do |format|
      if @teachers_textbook.save
        format.html { redirect_to teachers_textbooks_path, notice: 'Textbook was successfully created.' }
        format.json { render :show, status: :created, location: @teachers_textbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teachers_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teachers_textbook.update(teachers_textbook_params)
        format.html { redirect_to [:teachers, @teachers_textbook], notice: 'Textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @teachers_textbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teachers_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teachers_textbook.destroy
    respond_to do |format|
      format.html { redirect_to teachers_textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search
    @students_textbook = StudentsTextbook.where(textbook_id: @teachers_textbook.id)
    @students = Student.search(params[:keyword])
    @studying_students = []
    
    y = 0
    @students_id = []
    @students.length.times do
      @students_id << @students[y].id
      y += 1
    end
  

    @students_textbook.each do | x |
      if @students_id.include?(x.student.id)
        @studying_students << x
      end
    end

  end

  private

  def set_teachers_textbook
    @teachers_textbook = Textbook.find(params[:id])
    
  end

  def teachers_textbook_params
    params.require(:textbook).permit(:name, :note, :page, :image).merge(teacher_id: current_teacher.id)
  end
end
