class Category < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :recipes

  validates :name, :presence => true, :length => {:minimum => 3}
end
