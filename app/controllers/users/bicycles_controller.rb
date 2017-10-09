class Users::BicyclesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_bicycle, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: BicycleDatatable.new(view_context) }
    end
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = current_user.bicycles.new(bicycle_params)

    if @bicycle.save
      redirect_to edit_users_bicycle_path(@bicycle), notice: 'Success'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bicycle.update(bicycle_params)
      redirect_to edit_users_bicycle_path(@bicycle), notice: 'Success!'
    else
      render :edit
    end
  end

  def destroy
    @bicycle.destroy

    redirect_to users_bicycles_path, notice: 'Success!'
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:name, :description,
                                    :category_id, image_attributes: %i[id file _destroy])
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
