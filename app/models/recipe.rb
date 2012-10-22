class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :photo, :category_id, :ingredient_ids, :tag_ids
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :tags
  belongs_to :category

  validates :name, :presence => true, :length => {:minimum => 3}
  validates :description, :presence => true, :length => {:minimum => 5}
  validates :category, :presence => true
end
