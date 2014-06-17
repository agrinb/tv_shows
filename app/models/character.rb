class Character < ActiveRecord::Base
  belongs_to :television_show
  validates :character, presence: true
end
