class OffersController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    @lead = Lead.find(params[:lead_id])

    @offer = Offer.new(
      date: params[:date,
      lead_id: @lead.id,
      notes: params[:notes],
      company_name: params[:company_name],
      job_title: params[:job_title],
      location: params[:location],
      starting_salary: params[:starting_salary],
      first_date: params[:first_date]
    )

    if @offer.save
      if @lead.update(last_action: params[:date])
        flash[:notice] = "Your lead status has been successfully updated."
        redirect_to user_lead_path(@user.id, @offer.lead_id)
      else
        flash[:alert] = "An error occured when updating your lead status. Please try again."
        redirect_to user_lead_path(@user.id, @offer.lead_id)
      end
    else
      flash[:alert] = "An error occured when updating your lead status. Please try again."
      redirect_to user_lead_path(@user.id, @offer.lead_id)
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(
      notes: params[:notes],
      company_name: params[:company_name],
      job_title: params[:job_title],
      location: params[:location],
      starting_salary: params[:starting_salary],
      first_date: params[:first_date]
    )
      flash[:notice] = "Notes have been successfully updated."
      redirect_to user_lead_path(@user.id, @offer.lead_id)
    else
      flash[:alert] = "Error saving update. Please try again."
      redirect_to user_lead_path(@user.id, @offer.lead_id)
    end
  end

  private

  def set_user
   @user = User.find(params[:user_id])

   unless current_admin || current_user.id == @user.id
     flash[:alert] = "You are not authorized to view this page"
     redirect_to root_path
   end
  end
end
