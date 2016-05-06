class Pool < ActiveRecord::Base
  validates :name, length: { minimum: 1, maximum: 64 }

  has_many :matches
end
