class Monster < ApplicationRecord
  has_many :tweets
  validates :name, :birthdate, :phone , presence: true, uniqueness: true
end
