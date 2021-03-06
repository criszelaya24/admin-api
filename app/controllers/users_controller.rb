class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :is_admin?, except: :current_user_details
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.where(admin: false)

    render json: @users
  end

  def current_user_details
    @user = User.where(id: current_user.id)
    render json: @user, status: :ok
  end

  def users_admin
    @user = User.where(admin: true)
    render json: @user, status: :ok
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    render json: @user, status: :created, location: @user if @user.save
    render json: @user.errors, status: :unprocessable_entity unless @user.save
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    render json: { message: 'User Successfully deleted' }, status: 200 if @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
end
