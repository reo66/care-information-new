class IntermediatesController < ApplicationController
  
def create
  if Intermediate.where(user_id: current_user.id, care_user_id: params[:care_user_id], confirmation: false, indication: "更新").present?
    @care = current_user.intermediates.find_by(care_user_id: params[:care_user_id])
    @care.update(intermediate_params)
    @count =  Intermediate.where(user_id: current_user.id, confirmation: false, indication: "更新")
    redirect_back(fallback_location: params[:page])
  else
    @intermediate = current_user.intermediates.create(intermediate_params)
    @intermediate.save
    redirect_back(fallback_location: params[:page])
  end  
end

def destroy
  @intermediate = Intermediate.find_by(care_user_id: params[:care_user_id], user_id: current_user.id)
  if @intermediate.destroy
    redirect_to care_users_edit_index_user_path(current_user)
  end  
end

private

  def intermediate_params
    params.permit(:user_id, :care_user_id, :confirmation, :indication )
  end
end