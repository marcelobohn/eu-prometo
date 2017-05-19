class Promise < ApplicationRecord
  belongs_to :manager
  belongs_to :user

  def get_status
    if date_finish.nil?
      {type: I18n.t(0, scope: [:codes, :promise, :status], default: '?'), class: 'label label-warning cursor-default'}
    else
      {type: I18n.t(1, scope: [:codes, :promise, :status], default: '?'), class: 'label label-success cursor-default'}
    end
  end

  def finish(description, user_id = nil)
    self.update_attributes! description_finish: description, user_finish: user_id, date_finish: Date.today
  end

  def user_finish_email
    self.user_finish ? User.find(self.user_finish).email : nil
  end
end
