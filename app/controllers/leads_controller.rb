class LeadsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def index
    gon.user_id = params[:user_id]
  end

  def new
    gon.user_id = params[:user_id]
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(
      user_id: @user.id,
      name: params[:name],
      job_title: params[:job_title],
      company: params[:company],
      email_address: params[:email_address],
      phone: params[:phone],
      notes: params[:notes],
      last_action: params[:date]
    )

    if @lead.save
      @invite = Invite.new(
        date: params[:date],
        lead_id: @lead.id,
        notes: params[:invite_notes]
      )

      if @invite.save
        flash[:notice] = "Lead successfully created!"
        redirect_to user_lead_path(@user, @lead)
      else
        flash[:alert] = "There was an error when saving the lead. Please try again."
        render :new
      end
    else
      flash[:alert] = "There was an error when saving the lead. Please try again."
      render :new
    end
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])

    if @lead.update(
      name: params[:name],
      job_title: params[:job_title],
      company: params[:company],
      email_address: params[:email_address],
      phone: params[:phone],
      notes: params[:notes]
    )
      flash[:notice] = "Lead successfully updated!"
      redirect_to user_lead_path(@user.id, @lead.id)
    else
      flash[:alert] = "There was an error when saving the lead. Please try again."
      render :edit
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
