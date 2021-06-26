class IntermediatesController < ApplicationController
  
def create
  @intermediate = current_user.intermediates.create(intermediate_params)
  if @intermediate.save
    user = Intermediate.where(user_id: current_user,care_user_id: params[:care_user_id])
    care_user = CareUser.find_by(id: params[:care_user_id])
   care_user.update(confirm: true)
    redirect_to care_users_edit_index_user_path(current_user)
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
  params.permit(:user_id, :care_user_id, care_user_attributes: [:id, :confirm])

end
end