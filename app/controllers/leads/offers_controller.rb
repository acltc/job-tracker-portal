class Leads::OffersController < OffersController
  before_action :set_offerable
  before_action :set_user

  def create
    super
    @lead = Lead.find(@offer.offerable_id)
    if @offer.save
      if @lead.update(last_action: @offer.date)
        flash[:notice] = "Lead status has been successfully updated!"
      else
        flash[:alert] = "An error occured when updating your lead status. Please try again."
      end
      redirect_to user_lead_path(@user.id, @offer.offerable_id)
    end
  end

  private

  def set_offerable
    @offerable = Lead.find(params[:lead_id])
  end

  def set_user
    @user = User.find(params[:user_id])

    unless current_admin || current_user.id == @user.id
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end
