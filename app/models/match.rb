class Match < ActiveRecord::Base
  validates :begin_at, presence: true, allow_nil: false
  validates :local_country, presence: true, allow_nil: false
  validates :guess_country, presence: true, allow_nil: false
  validates :pool, presence: true, allow_nil: false

  belongs_to :local_country, class_name: 'Country'
  belongs_to :guess_country, class_name: 'Country'
  belongs_to :pool

end
