class PlantsController < ApplicationController
    before_action :authorize_request, except: [:index, :show]
  
    # GET /plants
    def index
      @plants = Plant.all
      render json: @plants
    end
  
    # GET /plants/:id
    def show
      @plant = Plant.find(params[:id])
      render json: @plant
    end
  
    # POST /plants
    def create
      @plant = Plant.new(plant_params)
      if @plant.save
        render json: @plant, status: :created
      else
        render json: @plant.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def plant_params
      params.require(:plant).permit(:name, :price, :climate, :description, :image, :additional_info)
    end
  end
  