class Monster < ApplicationRecord
  validate :phone_format
  has_many :tweets
  validates :name, :birthdate, :phone , presence: true, uniqueness: true

  def phone_format
    if PhoneValidator.new(phone).valid?
      return
    else
      errors.add(:phone, :invalid)
    end
  end
end
