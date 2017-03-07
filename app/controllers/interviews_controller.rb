class InterviewsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    @interview = @interviewable.interviews.new(interview_params)
  end

  def update
    @interview = Interview.find(params[:id])

    if @interview.update(
      notes: params[:notes]
    )
      flash[:notice] = "Notes have been successfully updated."
    else
      flash[:alert] = "Error saving update. Please try again."
    end
    if @interview.lead_id
      redirect_to user_lead_path(@user.id, @interview.lead_id)
    else
      redirect_to user_application_path(@user.id, @interview.application_id)
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

  def interview_params
    params.require(:interview).permit(:notes, :date)
  end
end
