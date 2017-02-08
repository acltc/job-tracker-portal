class OffersController < ApplicationController
  def create
    @lead = Lead.find(params[:lead_id])
    parsed_datetime = params[:date]["date(1i)"] + "-" + params[:date]["date(2i)"] + "-" + params[:date]["date(3i)"] + " " + params[:date]["date(4i)"] + ":" + params[:date]["date(5i)"]

    @offer = Offer.new(
      date: parsed_datetime,
      lead_id: @lead.id,
      notes: params[:notes]
    )

    if @offer.save
      if @lead.update(last_action: parsed_datetime)
        flash[:success] = "Your lead status has been successfully updated."
        redirect_to "/leads/#{@offer.lead_id}"
      else
        flash[:danger] = "An error occured when updating your lead status. Please try again."
        redirect_to "/leads/#{@offer.lead_id}"
      end
    else
      flash[:danger] = "An error occured when updating your lead status. Please try again."
      redirect_to "/leads/#{@offer.lead_id}"
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(
      notes: params[:notes]
    )
      flash[:success] = "Notes have been successfully updated."
      redirect_to "/leads/#{@offer.lead_id}"
    else
      flash[:danger] = "Error saving update. Please try again."
      redirect_to "/leads/#{@offer.lead_id}"
    end
  end
end
