require 'jwt'

class FavoritesController < ApplicationController
  before_action :authorize_request

  # GET /favorites
  def index
    favorites = @current_user.favorites.includes(:plant)
    render json: favorites.map { |favorite| plant_data(favorite.plant) }, status: :ok
  end

  # POST /favorites
  def create
    favorite = @current_user.favorites.build(plant_id: params[:plant_id])
    if favorite.save
      render json: plant_data(favorite.plant), status: :created
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/:id
  def destroy
    favorite = @current_user.favorites.find_by(plant_id: params[:plant_id])
    if favorite&.destroy
      render json: { message: 'Removed from favorites.' }, status: :ok
    else
      render json: { errors: ['Favorite not found.'] }, status: :not_found
    end
  end

  private

  # Authorizes the request and sets @current_user
  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })[0]
      @current_user = User.find(decoded['user_id'])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ['User not found.'] }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { errors: ['Invalid token.'] }, status: :unauthorized
    end
  end

  # Returns structured plant data for JSON output
  def plant_data(plant)
    {
      id: plant.id,
      name: plant.name,
      description: plant.description,
      price: plant.price,
      image_url: plant.image_url
    }
  end
end
