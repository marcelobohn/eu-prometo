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

  # enum type_manager: [ :president, :governor, :mayor ]

  validates_with TypeManagerAddress

  max_paginates_per 10

  def type_manager_text
    I18n.t(type_manager, scope: [:codes, :manager, :type], default: '?')
  end

  def get_local
    case type_manager
    when 0
      city.name + ' - ' + state.abbrev
    when 1
      state.name
    when 2
      country.name
    end
  end

  def get_resume_promises
    total = promise.count
    finished = promise.where.not(date_finish: nil).count
    opened = promise.where(date_finish: nil).count
    {
      total: total,
      finished: { count: finished, perc: total > 0 ? (finished*100)/total : 0 },
      opened: { count: opened, perc: total > 0 ? (opened*100)/total : 0 },
    }
  end

  def self.search(search)
    @managers = Manager.where(type_manager: search[:type_manager] || 0)
    @managers = @managers.where('lower(name) like ?', '%'+search[:text].downcase+'%') if (search[:text])
    @managers = @managers.limit(12)    
  end

end
