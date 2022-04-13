class Address < ApplicationRecord
  belongs_to :province

  validates :fname, :lname, :street, :city, :postalcode, presence: true
end
