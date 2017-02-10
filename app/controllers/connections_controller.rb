class ConnectionsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def create
    p "-------------"
    p "create triggered"
    p "-------------"

    @lead = Lead.find(params[:lead_id])
    parsed_datetime = params[:date]["date(1i)"] + "-" + params[:date]["date(2i)"] + "-" + params[:date]["date(3i)"] + " " + params[:date]["date(4i)"] + ":" + params[:date]["date(5i)"]

    @connection = Connection.new(
      date: parsed_datetime,
      lead_id: @lead.id,
      notes: params[:notes]
    )

    if @connection.save
      if @lead.update(last_action: parsed_datetime)
        flash[:success] = "Your lead status has been successfully updated."
        redirect_to user_lead_path(@user.id, @connection.lead_id)
      else
        flash[:danger] = "An error occured when updating your lead status. Please try again."
        redirect_to user_lead_path(@user.id, @connection.lead_id)
      end
    else
      flash[:danger] = "An error occured when updating your lead status. Please try again."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
    end
  end

  def update
    @connection = Connection.find(params[:id])

    if @connection.update(
      notes: params[:notes]
    )
      flash[:success] = "Notes have been successfully updated."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
    else
      flash[:danger] = "Error saving update. Please try again."
      redirect_to user_lead_path(@user.id, @connection.lead_id)
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
