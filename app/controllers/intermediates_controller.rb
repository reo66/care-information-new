class IntermediatesController < ApplicationController

  def update
    intermediate = Intermediate.find(params[:id])
    if intermediate.update!(intermediate_params)
      @count = Intermediate.where(user_id: current_user.id, indication: "更新後未確認")
      redirect_back(fallback_location: params[:page])
    end
  end

  private

  def intermediate_params
    params.permit(:care_user_id, :indication).merge(user_id: current_user.id)
  end
end