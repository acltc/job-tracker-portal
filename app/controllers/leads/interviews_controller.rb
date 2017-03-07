class Leads::InterviewsController < InterviewsController
  before_action :set_interviewable
  before_action :set_user

  def create
    super
    @lead = Lead.find(@interview.interviewable_id)
    if @interview.save
      if @lead.update(last_action: @interview.date)
        flash[:notice] = "Lead status has been successfully updated!"
      else
        flash[:alert] = "An error occured when updating your lead status. Please try again."
      end
      redirect_to user_lead_path(@user.id, @interview.interviewable_id)
    end
  end

  private

  def set_interviewable
    @interviewable = Lead.find(params[:lead_id])
  end

  def set_user
   @user = User.find(params[:user_id])

   unless current_admin || current_user.id == @user.id
     flash[:warning] = "You are not authorized to view this page"
     redirect_to root_path
   end
  end
end
