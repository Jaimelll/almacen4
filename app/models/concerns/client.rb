class Client < ApplicationRecord
  belongs_to :user

# validates :ruc, presence: true, length: {is: 11},uniqueness: true
validates :ruc, presence: true, uniqueness: true
validates :razon, presence: true, length: {minimum: 1},uniqueness: true

end
