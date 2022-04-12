class Province < ApplicationRecord
  has_many :addresses

  validates :province, presence: true
end
