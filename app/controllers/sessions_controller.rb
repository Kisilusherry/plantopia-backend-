class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        render json: { token: generate_token(user.id) }, status: :ok
      else
        render json: { errors: ['Invalid email or password'] }, status: :unauthorized
      end
    end
  
    private
  
    def generate_token(user_id)
      JWT.encode({ user_id: user_id }, Rails.application.secret_key_base)
    end
  end
  