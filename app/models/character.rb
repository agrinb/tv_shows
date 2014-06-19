class Character < ActiveRecord::Base
  belongs_to :television_show
  belongs_to :actor
  #has_one :actor
  validates :character, presence: true
end
