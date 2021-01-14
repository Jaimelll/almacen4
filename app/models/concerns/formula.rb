class Formula < ApplicationRecord
  belongs_to :product , :optional => true
  belongs_to :user
end
