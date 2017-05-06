class TypeManagerAddress < ActiveModel::Validator
  def validate(record)
    if record.type_manager == 'mayor' && record.city.nil?
      record.errors[:base] << "Mayor needs a City"
    end
  end
end

class Manager < ApplicationRecord
  belongs_to :election
  belongs_to :user
  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city, optional: true
  has_many :promise
  # accepts_nested_attributes_for :promise

  enum type_manager: [ :president, :governor, :mayor ]

  validates_with TypeManagerAddress
end
