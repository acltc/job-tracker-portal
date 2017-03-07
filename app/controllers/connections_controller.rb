class ConnectionsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    @lead = Lead.find(params[:lead_id])
    
    @connection = Connection.new(
      date: params[:date],
      lead_id: @lead.id,
      notes: params[:notes]
    )

    if @connection.save
      if @lead.update(last_action: params[:date])
        flash[:notice] = "Your lead status has been successfully updated."
        redirect_to user_lead_path(@user.id, @connection.lead_id)
      else
        flash[:alert] = "An error occured when updating your lead status. Please try again."
        redirect_to user_lead_path(@user.id, @connection.lead_id)
      end
    else
      flash[:alert] = "An error occured when updating your lead status. Please try again."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
    end
  end

  def update
    @connection = Connection.find(params[:id])

    if @connection.update(
      notes: params[:notes]
    )
      flash[:notice] = "Notes have been successfully updated."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
    else
      flash[:alert] = "Error saving update. Please try again."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
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
