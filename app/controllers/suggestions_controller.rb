class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = current_user.suggestions.new(suggestion_params)

    if @suggestion.save
      redirect_to @bicycle, notice: 'Success'
    else
      render :new
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:name, :description).merge(bicycle: @bicycle)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end
end
