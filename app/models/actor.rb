class Actor < ActiveRecord::Base
  has_many :characters
  validates :name, presence: true
end