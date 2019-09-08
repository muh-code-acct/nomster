class PlacesController < ApplicationController
    
    def index
        @places = Place.paginate(page: params[:page], per_page: 1)
    end
    
    def new
        @places = Place.new
    end
end
