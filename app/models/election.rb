class Election < ApplicationRecord
  enum type_election: [ :national, :municipal ]
end
