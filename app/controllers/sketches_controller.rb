class SketchesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

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
    authorize @sketch

    if @sketch.save
      flash[:notice] = "Sketch was saved."
      redirect_to sketches_index_path(current_user.username)
    else
      flash[:error] = "Wasn't saved Dave!"
      render :new
    end

  end

  def edit
    user = User.find_by(username: params[:username])
    @sketch = user.sketches.find_by!(slug: params[:slug])
    authorize @sketch
  end

  def update
    user = User.find_by(username: params[:username])
    @sketch = user.sketches.find_by!(slug: params[:slug])
    authorize @sketch

    if @sketch.update_attributes(sketch_params)
      flash[:notice] = "Sketch was updated."
      redirect_to sketches_index_path(current_user.username)
    else
      flash[:error] = "An error occurred when updating the sketch"
    end
  end

  def destroy
    user = User.find_by(username: params[:username])
    @sketch = user.sketches.find_by!(slug: params[:slug])
    authorize @sketch

    if @sketch.destroy
      flash[:notice] = "Your sketch has been deleted."
      redirect_to sketches_index_path(current_user.username)
    else
      flash[:error] = "There was an error deleting this sketch."
      render :show
    end
  end

  private

  def sketch_params
    permitted_attributes = [:title, :body]
    params.require(:sketch).permit(permitted_attributes)
  end

end
