class UsersController < ApplicationController
    def index
        # @users = User.select(:id, :name, :email)
        @users = User.all
        render json: @users
    end

    def create

        user = User.new(params.require(:user).permit(:username))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
 
        if params[:username]
            user = User.find_by(username: params[:username])
            if user
                render json: user
            else
                render user.errors.full_messages
            end
        else
            user = User.find(params[:id])
            if user
                render json: user
            else
                render user.errors.full_messages
            end
        end

        # user = User.find_by(identifier: params[:identifier])


        # if user
        #     render json: user
        # else
        #     render 'User not in database'
        # end
    end

    def update
        # user = redirect_to 'users'
        # if params[:name] && params[:email]
        #     user.name = params[:name]
        #     user.email = params[:email]
        # elsif params[:name]
        #     user.name = params[:name]
        # elsif params[:email]
        #     user.email = params[:email]
        # end

        user = User.find(params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :not_changeable
        end
    end

    def destroy
        user = User.find(params[:id])

        if user.destroy
            render json: 'user deleted'
        else
            render json: 'user does not exist', status: :no_user_found
        end
    end

    def user_params
        params.require(:user).permit(:username)
    end

end