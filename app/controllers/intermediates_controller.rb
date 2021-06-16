class IntermediatesController < ApplicationController



def create
  @intermediate = current_user.intermediates.create(care_user_id: params[:care_user_id])
  if @intermediate.save
    redirect_to care_users_edit_index_user_path(current_user)
  end
end

def destroy
  @intermediate = Intermediate.find_by(care_user_id: params[:care_user_id], user_id: current_user.id)
  if @intermediate.destroy
    redirect_to care_users_edit_index_user_path(current_user)
  end  
end


end