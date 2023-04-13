class ArtworkSharesController < ApplicationRecord
    def create
        share = ArtworkShare.new(artwork_shares_params)

        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end 
    end

    def destroy
        share = ArtworkShare.find(params[:id])

        if share.destroy
            render json: 'share was destroyed'
        else
            render json: 'share does not exist'
        end
    end

    def artwork_shares_params
        params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
    end

end