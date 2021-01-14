class Item < ApplicationRecord
  belongs_to :client
  belongs_to :user

  #### necesario para borrar hijos con el padre
  has_many :details, :dependent => :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  #####

 validates_uniqueness_of :nfactu, :scope => [:serie, :client_id, :documento]




end
