class Api::V1::ReviewsController < ApplicationController
  before_action :find_review, except: [:create, :index]

    def index 
      @reviews = Review.all
      render json: @reviews 
    end 

    def show
      render json: @review
    end
  
    def create
      @review = Review.create(reviews_params)
      if @review.valid?
        render json: { review: ReviewSerializer.new(@review)}, status: :created
      else
        render json: { error: 'failed to create review' }, status: :not_acceptable
      end
    end
  
    def update
      @review.update(reviews_params)
      render json: @review
    end
  
    def destroy
      @review.destroy
    end
    
    private 
    
    def find_review
      @review = Review.find(params[:id])
    end
  
    def reviews_params
      params.require(:review).permit(:id, :location_id, :user_id, :title, :rating, :content)
    end
end
