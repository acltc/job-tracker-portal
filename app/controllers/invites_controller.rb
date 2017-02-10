class InvitesController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def update
    @invite = Invite.find(params[:id])

    if @invite.update(
      notes: params[:notes]
    )
      flash[:success] = "Notes have been successfully updated."
      redirect_to user_lead_path(@user.id, @invite.lead_id)
    else
      flash[:danger] = "Error saving update. Please try again."
      redirect_to user_lead_path(@user.id, @invite.lead_id)
    end
  end

  private

  def set_user
   @user = User.find(params[:user_id])

   unless current_admin || current_user.id == @user.id
     flash[:warning] = "You are not authorized to view this page"
     redirect_to root_path
   end
  end
end
