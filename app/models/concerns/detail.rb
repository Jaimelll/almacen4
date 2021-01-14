class Detail < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :cantidad, presence: true
  validates :monto, presence: true

  
end
