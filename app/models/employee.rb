class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :about, :faq, :descriptions_attributes
  has_many :descriptions
  has_many :comments
  has_many :milestones
  accepts_nested_attributes_for :descriptions, allow_destroy: true
end
