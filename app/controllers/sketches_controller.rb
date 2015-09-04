class SketchesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    user = User.find_by(username: params[:username])
    @sketches = user.sketches
  end

  def show
    user = User.find_by(username: params[:username])
    @sketch = user.sketches.find_by!(slug: params[:slug])
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
