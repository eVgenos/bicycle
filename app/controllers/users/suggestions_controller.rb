class Users::SuggestionsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_suggestion, except: :index

  def index
    @suggestions = @bicycle.suggestions.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def update
    if @bicycle.update(suggestion_params)

      destroy
    else
      render :edit
    end
  end

  def destroy
    @suggestion.destroy

    redirect_to users_bicycle_suggestions_path(@bicycle), notice: 'Success!'
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:name, :description)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
