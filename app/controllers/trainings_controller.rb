class TrainingsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:top]}

  def top
    @trainings = Training.where(user_id: session[:user_id])
  end

  def new
    @today = Date.today
  end

  def create
    @trainings = Training.new(
      user_id: @current_user.id,
      start_time: params[:date],
      event: params[:event],
      reps: params[:reps],
      weight: params[:weight]
    )
    if @trainings.save
      flash[:notice] = "Workout Recorded!"
      redirect_to("/workout/#{@current_user.id}/")
    else
      flash[:notice] = "Record Failed... Try again..."
      render("trainings/new")
    end
  end

  def edit
    @workout = Training.find_by(id: params[:id])
  end

  def update
    @workout = Training.find_by(id: params[:id])
    @workout.event = params[:event]
    @workout.weight = params[:weight]
    @workout.reps = params[:reps]
    @workout.start_time = params[:date]
    if @workout.save
      flash[:notice] = "Workout Record Edit Complete!"
      redirect_to("/workout/#{@current_user.id}")
    else
      flash[:notice] = "Record Failed... Try again..."
      render("trainings/edit")
    end
  end

end