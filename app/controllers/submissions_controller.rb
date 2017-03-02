class SubmissionsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def update
    @submission = Submission.find(params[:id])

    if @submission.update(
      notes: params[:notes]
    )
      flash[:notice] = "Notes have been successfully updated."
      redirect_to user_lead_path(@user.id, @submission.lead_id)
    else
      flash[:alert] = "Error saving update. Please try again."
      redirect_to user_lead_path(@user.id, @submission.lead_id)
    end
  end

  private

  def set_user
   @user = User.find(params[:user_id])

   unless current_admin || current_user.id == @user.id
     flash[:notice] = "You are not authorized to view this page"
     redirect_to root_path
   end
  end
end
