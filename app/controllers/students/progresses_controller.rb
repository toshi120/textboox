class Students::ProgressesController < Students::ApplicationController

  def new
    @progress = Progress.new
  end

  def create
  end
end
