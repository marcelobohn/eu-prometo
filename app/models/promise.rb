class Promise < ApplicationRecord
  belongs_to :manager

  def get_status
    if date_finish.nil?
      {type: :open, class: 'label label-warning cursor-pointer'}
    else
      # {type: :close, class: 'bg-green-close'}
      {type: :close, class: 'label label-success cursor-pointer'}
    end
  end
end
