class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
      user = User.new(user_params) #:user here is the name of the hash. So we need to pass in our values as user[:name]
      if user.save
        redirect_to user_url(params[:id])
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      user = User.find(params[:id])
      render json: user
    end

    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.errors.full_messages
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: user
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
