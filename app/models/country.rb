class Country < ActiveRecord::Base
  has_many :local_matches, class_name: 'Match', foreign_key: :first_country_id
  has_many :remote_matches, class_name: 'Match', foreign_key: :second_country_id
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, styles: { thumb: ["300x100#"] }
end
