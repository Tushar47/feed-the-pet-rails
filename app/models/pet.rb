class Pet < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  attr_accessible :health, :name, :picture
  belongs_to :owner

  validates_presence_of :name
end
