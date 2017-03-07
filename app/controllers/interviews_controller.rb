class InterviewsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    @interview = @interviewable.interviews.new(interview_params)
  end

  # def create
  #   if params[:lead_id]
  #     @type = Lead.find(params[:lead_id])
  #   else  
  #     @type = Application.find(params[:application_id])
  #   end

  #   @interview = Interview.new(
  #     date: params[:date],
  #     notes: params[:notes], 
  #     interviewable: @type
  #   )

  #   if @interview.save
  #     if @lead.update(last_action: params[:date])
  #       flash[:notice] = "Your lead status has been successfully updated."
  #     end
  #   else
  #       flash[:alert] = "An error occured when updating your lead status. Please try again."
  #   end
  #   redirect_to user_lead_path(@user.id, @interview.lead_id)
  # end

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
