class ApplicationsController < ApplicationController
  before_action :authenticate_authorized_user
  before_action :set_user

  def index
    gon.user_id = params[:user_id]
  end

  def new
    gon.user_id = params[:user_id]
    @date = Date.today
    @application = Application.new
    @application.submission = Submission.new
  end

  def create
    @application = Application.new(
      user_id: @user.id,
      job_title: params[:job_title],
      company: params[:company],
      notes: params[:notes],
      last_action: params[:last_action]
    )

    if @application.save
      @submission = Submission.new(
        date: params[:last_action],
        application_id: @application.id,
        notes: params[:submission_notes]
      )

      if @submission.save
        flash[:notice] = "Application successfully created!"
        redirect_to user_application_path(@user, @application)
      else
        flash[:alert] = "There was an error when saving the application. Please try again."
        render :new
      end
    else
      flash[:alert] = "There was an error when saving the application. Please try again."
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])

    if @application.update(
      job_title: params[:job_title],
      company: params[:company],
      notes: params[:notes]
    )
      flash[:notice] = "Application successfully updated!"
      redirect_to user_application_path(@user.id, @application.id)
    else
      flash[:alert] = "There was an error when saving the application. Please try again."
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
