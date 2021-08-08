class Teachers::ReadsController < Teachers::ApplicationController
  before_action :set_progress

  def create
    @teachers_textbook = Textbook.find(params[:textbook_id])
    @read = Read.where(teacher_id: current_teacher.id).find_by(progress_id: @progress.id)
    read_check = Read.new(read_params)
    read_check.save

    # データを再度チェックする
    @read = Read.where(teacher_id: current_teacher.id).find_by(progress_id: @progress.id)

  end

  def destroy
    @teachers_textbook = Textbook.find(params[:textbook_id])
    @read = Read.where(teacher_id: current_teacher.id).find_by(progress_id: @progress.id)
    @read.destroy

    # データが削除されていることをチェックする
    @read = Read.where(teacher_id: current_teacher.id).find_by(progress_id: @progress.id)

    # ------------------------------------------------------------------------------- #
    # _read.html.erbにて現在は@read.idを渡している。生徒と@readが複数登録された際に誤作動起こす場合はstudent_idを渡す必要がある可能性がある。その場合はここで@studentを作成し、create.js.erbにてlocals:{}の中に追加して渡す。
    # ------------------------------------------------------------------------------- #

  end


  private

  def set_progress
    @progress = Progress.find(params[:progress_id])
  end

  def read_params
    params.permit(:read).merge(teacher_id: current_teacher.id, progress_id: @progress.id)
  end
end
