class Teachers::TextbooksController < Teachers::ApplicationController
  before_action :set_teachers_textbook, only: %i[ show edit update destroy ]

  # GET /teachers/textbooks or /teachers/textbooks.json
  def index
    @teachers_textbooks = Textbook.all
  end

  # GET /teachers/textbooks/1 or /teachers/textbooks/1.json
  def show
    @confirm_students = StudentsTextbook.where(textbook_id: @teachers_textbook.id)
  end

  # GET /teachers/textbooks/new
  def new
    @teachers_textbook = Textbook.new
  end

  # GET /teachers/textbooks/1/edit
  def edit
  end

  # POST /teachers/textbooks or /teachers/textbooks.json
  def create
    @teachers_textbook = Textbook.new(teachers_textbook_params)

    respond_to do |format|
      if @teachers_textbook.save
        format.html { redirect_to teachers_textbooks_path, notice: "Textbook was successfully created." }
        format.json { render :show, status: :created, location: @teachers_textbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teachers_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/textbooks/1 or /teachers/textbooks/1.json
  def update
    respond_to do |format|
      if @teachers_textbook.update(teachers_textbook_params)
        format.html { redirect_to [:teachers, @teachers_textbook], notice: "Textbook was successfully updated." }
        format.json { render :show, status: :ok, location: @teachers_textbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teachers_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/textbooks/1 or /teachers/textbooks/1.json
  def destroy
    @teachers_textbook.destroy
    respond_to do |format|
      format.html { redirect_to teachers_textbooks_url, notice: "Textbook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teachers_textbook
      @teachers_textbook = Textbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teachers_textbook_params
      # params.fetch(:teachers_textbook, {})
      params.require(:textbook).permit(:name, :note, :page, :image).merge(teacher_id: current_teacher.id)
    end
end
