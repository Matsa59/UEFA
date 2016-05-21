class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  phony_normalize :phone_number, default_country_code: 'FR'


  validates :first_name, presence: true, allow_nil: false, length: {minimum: 3, maximum: 48}
  validates :last_name, presence: true, allow_nil: false, length: {minimum: 3, maximum: 48}
  validates :address, presence: true, allow_nil: false, length: {minimum: 3, maximum: 255}
  validates :city, presence: true, allow_nil: false, length: {minimum: 2, maximum: 100}
  validates :zip_code, presence: true, allow_nil: false, :numericality => { :greater_than_or_equal_to => 0 }

  validates :phone_number, phony_plausible: true, presence: true, allow_nil: false
end
