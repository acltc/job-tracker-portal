class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_authorized_user

  def index
    @applications = Application.all
    render 'index.json.jbuilder'
  end

  def show
    @application = Application.find(params[:id])
    render 'show.json.jbuilder'
  end
end
