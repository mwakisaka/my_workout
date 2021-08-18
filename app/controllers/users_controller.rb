class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def new

  end

  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email], 
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to My Workout!"
      redirect_to("/")
    else
      @error_message = "Invalid Email or Password or Both."
      @email = params[:email]
      @password = params[:password]
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "User Edit Complete!"
      redirect_to("/")
    else
      render("users/edit")
    end
  end

  def destroy
    session[:user_id] = nil
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "Account Delete Complete. See you again!"
      redirect_to("/")
    else
      flash[:notice] = "Account Delete Failed. Try again."
      render("users/edit")
   end
  end

  def login_form

  end

  def login
    @user = User.find_by(
      email: params[:email], 
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful!"
      redirect_to("/")
    else
      @error_message = "Invalid Email or Password or Both."
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logout Complete. See you next workout!"
    redirect_to("/")
  end
end