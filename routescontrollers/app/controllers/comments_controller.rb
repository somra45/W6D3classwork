class CommentsController < ApplicationController

    def index
        artwork = Artwork.find(params{:artwork_id})
        user = User.find(params[:author_id])

        if artwork && !user
            render json: artwork.comments
        elsif user && !artwork
            render json: user.comments
        elsif user && artwork
            render json: (artwork.comments + user.comments)
        else
            render json: 'no comments found'
        end
    end

    def create
        comment = Comment.new(comments_params)

        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages
        end
    end

    def destroy
        comment = Comment.find(params[:id])

        if comment.destroy
            render json: 'comment was destroyed'
        else
            render json: 'comment does not exist'
        end
    end

    def comments_params
        params.require(:comment).permit(:author_id, :body, :artwork_id)
    end
end