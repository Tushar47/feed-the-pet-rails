class Pet < ActiveRecord::Base
  attr_accessible :health, :name
  belongs_to :owner
end
