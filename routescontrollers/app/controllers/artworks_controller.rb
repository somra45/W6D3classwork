class ArtworksController < ApplicationController
    def index 
        artworks = Artwork.artworks_for_user_id(params[:user_id])

        render json: artworks
    end

    def show
        artwork = Artwork.find(params[:id])
        if artwork
            render json: artwork
        else
            render json: 'artwork does not exist'
        end
    end
    
    def create
        artwork = Artwork.new(artwork_params)
        
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        artwork = Artwork.find(params[:id])

        if artwork.destroy
            render json: 'artwork was destroyed'
        else
            render json: 'artwork does not exist'
        end
    end
    
    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: 'update successful'
        else
            render json: 'if it doesnt work the first time try try again'
        end
    end

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end