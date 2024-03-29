class Ingredient < ActiveRecord::Base
  attr_accessible :name, :description, :delete_image, :image, :is_main
  has_and_belongs_to_many :recipes

  has_attached_file :image, :styles => { :thumb => "150x150#" }
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :name, :presence => true, :length => {:minimum => 3}

  default_scope :order => :name

  def thumb_image
    image.url(:thumb)
  end
end
