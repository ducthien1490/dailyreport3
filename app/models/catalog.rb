class Catalog < ActiveRecord::Base
  belongs_to :group
  has_many :catalogs
  validates :content, presence: true, length: { maximum: 200} # cau hoi
  validates :group_id,presence:true
end
