class UsersController < ApplicationController
  before_action :find_user, except: [:create, :index, :login]

  def index
    @user = User.all
    render json: @user 
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user)}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user.valid?
      render json: { user: UserSerializer.new(@user)}
    else
      render json: { error: 'failed to login user' }
    end
  end
  
  private 
  
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :username, :email, :age, :address, :city, :state, :country, :zipcode, :bio, :password)
  end
end
