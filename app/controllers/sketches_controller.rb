class SketchesController < ApplicationController

  before_action :authenticate_user!

  def index
    @sketches = current_user.sketches
  end

  def show

  end
  
  def new
    @sketch = current_user.sketches.new
    authorize @sketch
  end

  def create
    @sketch = current_user.sketches.build(sketch_params)

    if @sketch.save
      flash[:notice] = "Sketch was saved."
      redirect_to sketches_path
    else
      flash[:error] = "Wasn't saved Dave!"
      render :new
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def sketch_params
    permitted_attributes = [:title, :body]
    params.require(:sketch).permit(permitted_attributes)
  end

end
