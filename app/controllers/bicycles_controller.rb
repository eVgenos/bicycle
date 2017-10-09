class BicyclesController < ApplicationController
  before_action :set_bicycle, only: %i[show use]
  before_action :set_categories, only: %i[index show]

  def index
    @bicycles = Bicycle.filter(params.slice(:category, :search))
                       .where.not(id: try(:current_user).try(:usages).try(:pluck, :bicycle_id))
                       .order(created_at: :desc)
                       .paginate(page: params[:page], per_page: 2)
  end

  def show; end

  def use
    current_user.usages.create(bicycle_id: @bicycle.id)

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Success!' }
      format.js
    end
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
