class BodiesController < ApplicationController
before_action :authenticate_user
before_action :ensure_correct_user, {only: [:top]}


  def top
    @bodies = Body.where(user_id: session[:user_id])
  end

  def new
    @today = Date.today
  end

  def show
    @body = Body.find_by(:params[:id])
  end

  def create
    @body = Body.new(
      user_id: @current_user.id,
      start_time: params[:date],
      weight: params[:body_weight],
    )
    if @body.save
      flash[:notice] = "Body Weight Recorded!"
      redirect_to("/body/#{@current_user.id}/")
    else
      flash[:notice] = "Record Failed... Try again..."
      render("bodies/new")
    end
  end

  def edit
    @body = Body.find_by(id: params[:id])
  end

  def update
    @body = Body.find_by(id: params[:id])
    @body.weight = params[:weight]
    @body.start_time = params[:date]
    if @body.save
      flash[:notice] = "Body Weight Edit Complete!"
      redirect_to("/body/#{@current_user.id}")
    else
      flash[:notice] = "Record Failed... Try again..."
      render("bodies/edit")
    end
  end

  def destroy
    @body = Body.find_by(id: params[:id])
    if @body.destroy
      flash[:notice] = "Record Deleted."
      redirect_to("/body/#{@current_user.id}")
    else
      flash[:notice] = "Delete Failed. Try again."
      render("bodies/#{@body.id}/edit")
    end
  end
end