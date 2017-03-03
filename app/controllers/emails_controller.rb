class EmailsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    @lead = Lead.find(params[:lead_id])

    @email = Email.new(
      date: params[:date],
      lead_id: @lead.id,
      notes: params[:notes]
    )

    if @email.save
      if @lead.update(last_action: params[:date])
        flash[:notice] = 'Update successful.'
      else
        flash[:alert] = 'An error occured.'
      end
    else
      flash[:alert] = 'An error occured.'
    end
    redirect_to user_lead_path(@user.id, @email.lead_id)
  end

  def update
    @email = Email.find(params[:id])

    if @email.update(notes: params[:notes])
      flash[:notice] = 'Notes have been successfully updated.'
    else
      flash[:alert] = 'Error saving update. Please try again.'
    end
    redirect_to user_lead_path(@user.id, @email.lead_id)
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
