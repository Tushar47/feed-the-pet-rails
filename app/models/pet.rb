class Pet < ActiveRecord::Base
  attr_accessible :health, :name
  belongs_to :owner

  validates_presence_of :name
end
