class Answer < ActiveRecord::Base
	  belongs_to :user
	  belong_to :catalog
	  validates :content, length: { maximum: 200} # cau tra loi
      validates :catalog_id,presence: true
      validates :user_id,presence: true
      default_scope -> { order('created_at DESC') }

end
