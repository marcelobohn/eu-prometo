class Manager < ApplicationRecord
  belongs_to :election
  belongs_to :user
  belongs_to :country
  belongs_to :state
  belongs_to :city
end
