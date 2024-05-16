class CartsController < ApplicationController
    before_action :authorize_request
  
    def index
      cart_items = @current_user.carts.includes(:plant)
      render json: cart_items.map { |item| { plant: item.plant, quantity: item.quantity } }, status: :ok
    end
  
    def create
      cart_item = @current_user.carts.find_or_initialize_by(plant_id: params[:plant_id])
      cart_item.quantity += params[:quantity].to_i
      if cart_item.save
        render json: cart_item, status: :created
      else
        render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      cart_item = @current_user.carts.find_by(plant_id: params[:plant_id])
      if cart_item&.update(quantity: params[:quantity])
        render json: cart_item, status: :ok
      else
        render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      cart_item = @current_user.carts.find_by(plant_id: params[:plant_id])
      if cart_item&.destroy
        render json: { message: 'Removed from cart' }, status: :ok
      else
        render json: { errors: ['Not found'] }, status: :not_found
      end
    end
  
    private
  
    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = JWT.decode(header, Rails.application.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
  