class Art < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :avatar, presence: true

  has_attached_file :avatar, styles: { :medium => "250x200" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
