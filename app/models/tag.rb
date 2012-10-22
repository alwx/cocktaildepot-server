class Tag < ActiveRecord::Base
  attr_accessible :name, :description
  has_and_belongs_to_many :recipes

  validates :name, :presence => true, :length => {:minimum => 3}
end
