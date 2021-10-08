class UsersController < ApplicationController
  # .find etc all activerecord queries

    def index
        users = User.all
        render json: users
    end

    def create
      user = User.new(user_params) #:user here is the name of the hash. So we need to pass in our values as user[:name]
      if user.save
        render json: user # redirect_to user_url(params[:id])
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      user = User.find(params[:id]) #ar object
      render json: user
    end

    # rails generates both patch and put for update
    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.errors.full_messages
      end
    end

    # delete does not do callbacks like dependent destroy
    def destroy
      user = User.find(params[:id]) # from url, nothing to do with table
      user.destroy
      render json: user
    end

    private
    def user_params
      # user - name of hash
      # params - possible keys (variable/col)
      params.require(:user).permit(:username)
    end

    # params is a hash thing
end
