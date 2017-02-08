class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    parsed_datetime = params[:last_action]["date(1i)"] + "-" + params[:last_action]["date(2i)"] + "-" + params[:last_action]["date(3i)"] + " " + params[:last_action]["date(4i)"] + ":" + params[:last_action]["date(5i)"]

    @lead = Lead.new(
      # Make user update dynamically when Devise is set up!
      user_id: 1,
      name: params[:name],
      job_title: params[:job_title],
      company: params[:company],
      email_address: params[:email_address],
      phone: params[:phone],
      notes: params[:notes],
      last_action: parsed_datetime
    )

    if @lead.save
      @invite = Invite.new(
        date: parsed_datetime,
        lead_id: @lead.id,
        notes: params[:invite_notes]
      )

      if @invite.save
        flash[:success] = "Lead successfully created!"
        redirect_to "/leads/#{@lead.id}"
      else
        flash[:danger] = "There was an error when saving the lead. Please try again."
        render :new
      end
    else
      flash[:danger] = "There was an error when saving the lead. Please try again."
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
      flash[:success] = "Lead successfully updated!"
      redirect_to "/leads/#{@lead.id}"
    else
      flash[:danger] = "There was an error when saving the lead. Please try again."
      render :edit
    end
  end
end
