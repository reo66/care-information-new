module CareUsersHelper

  def intermediate_indication(care_user_id)
    intermediate = Intermediate.select(:indication).find_by(user_id: current_user, care_user_id: care_user_id)

    return intermediate.indication
  end

end
