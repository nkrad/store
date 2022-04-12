class Address < ApplicationRecord
  belongs_to :user

  validates :fname, :lname, :street, :city, :postalcode, presence: true
end
