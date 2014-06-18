class Character < ActiveRecord::Base
  belongs_to :television_show
  has_one :actor
  validates :character, presence: true
end
