class Employee < ActiveRecord::Base
  attr_accessible :name, :descriptions_attributes
  has_many :descriptions
  has_many :comments
  accepts_nested_attributes_for :descriptions, allow_destroy: true
end
