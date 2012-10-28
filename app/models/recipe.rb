class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :ingredient_ids, :tag_ids, :delete_image, :image
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :tags
  belongs_to :category

  has_attached_file :image, :styles => { :thumb => "150x150#", :full => "400x400#" }
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :name, :presence => true, :length => {:minimum => 3}
  validates :description, :presence => true, :length => {:minimum => 5}
  validates :category, :presence => true

  default_scope :order => :name

  def thumb_image
    image.url(:thumb)
  end

  def full_image
    image.url(:full)
  end
end
