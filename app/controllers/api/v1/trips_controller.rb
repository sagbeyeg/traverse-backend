class Api::V1::TripsController < ApplicationController
  before_action :find_trip, except: [:create, :index]

    def index 
      @trips = Trip.all
      render json: @trips
    end 

    def show
      render json: @trip
    end
  
    def create
      @trip = Trip.create(trips_params)
      if @trip.valid?
        render json: { trip: TripSerializer.new(@trip)}, status: :created
      else
        render json: { error: 'failed to create trip' }, status: :not_acceptable
      end
    end
  
    def update
      @trip.update(trips_params)
      render json: @trip
    end
  
    def destroy
      @trip.destroy
    end
    
    private 
    
    def find_trip
      @trip = Trip.find(params[:id])
    end
  
    def trips_params
      params.require(:trip).permit(:id, :location_id, :user_id, :start_date, :end_date, :note)
    end
end
