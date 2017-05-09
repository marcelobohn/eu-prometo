class Election < ApplicationRecord
  def type_election_text
    I18n.t(type_election, scope: [:codes, :election, :type], default: '?')
  end
end
