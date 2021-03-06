class Product < ApplicationRecord
  belongs_to :category
  belongs_to :order_detail

  paginates_per 8

  has_one_attached :image

  # requires each field to be present
  validates :name, :designer, :size, :description, :price, presence: true
  validates :price, numericality: true
end
