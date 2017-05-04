class Manager < ApplicationRecord
  belongs_to :election
  belongs_to :user
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :promise
  # accepts_nested_attributes_for :promise
end
