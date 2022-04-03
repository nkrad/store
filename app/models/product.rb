class Product < ApplicationRecord
  belongs_to :category

  paginates_per 8

  has_one_attached :image
end
