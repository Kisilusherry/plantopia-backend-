class Plant < ApplicationRecord
    validates :name, :price, :climate, :description, :image, :additional_info, presence: true
    has_many :favorites
    has_many :carts
  end
  