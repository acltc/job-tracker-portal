class PagesController < ApplicationController
  before_action :authenticate_authorized_user, only: [:dashboard]
  before_action :set_user, only: [:dashboard]

  def dashboard
  end

  def home
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
