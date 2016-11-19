class Stade < ActiveRecord::Base
  validates :name, length: { minimum: 3, maximum: 100 }, allow_nil: false, presence: true

  has_many :matches
end
