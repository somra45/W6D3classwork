class UsersController < ApplicationController
    def index
        # @users = User.select(:id, :name, :email)
        @users = User.all
        render json: @users
    end

    def create

        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
 
        if params[:name]
            user = User.find_by(name: params[:name])
            if user
                render json: user
            else
                render 'User not in database'
            end
        elsif params[:email]
            user = User.find_by(email: params[:email])
            if user
                render json: user
            else
                render 'User not in database'
            end
        else
            user = User.find_by(id: params.values.first)
            if user
                render json: user
            else
                render 'User not in database'
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
            render json: 'user cannot be updated', status: :not_changeable
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
        params.require(:user).permit(:name, :email)
    end

end