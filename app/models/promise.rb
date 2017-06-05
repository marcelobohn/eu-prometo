class Promise < ApplicationRecord
  belongs_to :manager
  belongs_to :user
  has_many :comments
  has_many :favorites

  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :description_finish, length: { maximum: 500 }

  def isFavorite? user
    (self.favorites.where(user_id: user_id).where(remove: nil).last) ? true : false
  end

  def add_favorite user
    f = self.favorites.where(user_id: user_id).where(remove: nil).last
    !f ? (self.favorites.create user: user) : (f.update remove: Time.now)
  end

  def get_status
    if date_finish.nil?
      if description_finish.nil?
        {type: I18n.t(0, scope: [:codes, :promise, :status], default: '?'), class: 'label label-warning cursor-default'}
      else
        {type: I18n.t(2, scope: [:codes, :promise, :status], default: '?'), class: 'label label-danger cursor-default'}
      end
    else
      {type: I18n.t(1, scope: [:codes, :promise, :status], default: '?'), class: 'label label-success cursor-default'}
    end
  end

  def finish(description, user_id = nil)
    self.update_attributes! description_finish: description, user_finish: user_id, date_finish: Date.today
  end

  def contest(description, user_id = nil)
    self.update_attributes! date_finish: nil
    self.comments.create description: description, user_id: user_id
  end

  def user_finish_email
    self.user_finish ? User.find(self.user_finish).email : nil
  end

  def user_finish_name
    self.user_finish ? User.find(self.user_finish).name || 'Restrito' : nil
  end

  def video_link_embed
    self.video_link.split('?v=').last
  end
end
