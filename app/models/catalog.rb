class Catalog < ActiveRecord::Base
  belongs_to :group
  has_many :answers
  validates :content, presence: true, length: { maximum: 400} # cau hoi
  validates :group_id,presence:true
end
