module BicyclesHelper
  def can_suggest?
    !try(:current_user).try(:suggestions).exists?(bicycle_id: params[:id])
  end
end
