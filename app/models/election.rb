class Election < ApplicationRecord
  max_paginates_per 10

  def type_election_text
    I18n.t(type_election, scope: [:codes, :election, :type], default: '?')
  end
end
