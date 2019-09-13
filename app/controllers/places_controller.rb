class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @places = Place.paginate(page: params[:page], per_page: 1)
    end
    
    def new
        @places = Place.new
    end
    
    def create
        current_user.places.create(place_params)
        if @place.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @place = Place.find(params[:id])
    end
    
    def edit
        @place = Place.find(params[:id])
        
        if @place.user != current_user
            return render plain: 'Hey, gtfo, you do not belong here...nice try', status: :forbidden
        end
    end
    
    def update
        @place = Place.find(params[:id])
        if @place.user != current_user
            return render plain: 'WOW aint you sneaky!! Better luck next time :)', status: :forbidden
        end
        @place.update_attributes(place_params)
        if @place.valid?
            redirect_ root_path
        else
            render :edit, status: :unprocessable_entity
        end
        redirect_to root_path
    end
    
    def destroy
        @place = Place.find(params[:id])
        if @place.user != current_user
            return render plain: "Dont be a dick", status: :forbidden
        @place.destroy
        redirect_to root_path
    end
    
    private
    
    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end
