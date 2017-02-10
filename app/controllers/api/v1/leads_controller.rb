class Api::V1::LeadsController < ApplicationController
  before_action :authenticate_authorized_user

  def index
    @leads = Lead.all
    render 'index.json.jbuilder'
  end

  def show
    @lead = Lead.find(params[:id])
    render 'show.json.jbuilder'
  end
end
