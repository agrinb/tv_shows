class Character < ActiveRecord::Base
  belongs_to :television_show
  belongs_to :actor
  accepts_nested_attributes_for :actor
  #has_one :actor
  validates :character, presence: true, uniqueness: { scope: :television_show }
end
