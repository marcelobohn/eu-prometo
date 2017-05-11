class Promise < ApplicationRecord
  belongs_to :manager

  def get_status
    if date_finish.nil?
      {type: I18n.t(0, scope: [:codes, :promise, :status], default: '?'), class: 'label label-warning cursor-default'}
    else
      {type: I18n.t(1, scope: [:codes, :promise, :status], default: '?'), class: 'label label-success cursor-default'}
    end
  end
end
