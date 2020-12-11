class Api::V1::LocationsController < ApplicationController
  before_action :find_location, only: [:show]

    def index 
      @locations = Location.all
      render json: @locations 
    end 

    def show
      render json: @location
    end
  
    def create
      @location = Location.create(locations_params)
      if @location.valid?
        render json: { location: LocationSerializer.new(@location)}, status: :created
      else
        render json: { error: 'failed to create location' }, status: :not_acceptable
      end
    end
    
    private 
    
    def find_location
      @location = Location.find(params[:id])
    end
  
    def locations_params
      params.require(:location).permit(:id, :name, :description)
    end
end
