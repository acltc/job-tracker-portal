class InvitesController < ApplicationController
  def update
    @invite = Invite.find(params[:id])

    if @invite.update(
      notes: params[:notes]
    )
      flash[:success] = "Notes have been successfully updated."
      redirect_to "/leads/#{@invite.lead_id}"
    else
      flash[:danger] = "Error saving update. Please try again."
      redirect_to "/leads/#{@invite.lead_id}"
    end
  end
end
