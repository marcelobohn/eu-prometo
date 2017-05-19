class Promise < ApplicationRecord
  belongs_to :manager
  belongs_to :user
  # belongs_to :user, :foreign_key "user_finish"
  # belongs_to :manager, class_name: "Employee"
  # belongs_to :user_finish, class_name: "User", optional: true

  def get_status
    if date_finish.nil?
      {type: I18n.t(0, scope: [:codes, :promise, :status], default: '?'), class: 'label label-warning cursor-default'}
    else
      {type: I18n.t(1, scope: [:codes, :promise, :status], default: '?'), class: 'label label-success cursor-default'}
    end
  end
end
