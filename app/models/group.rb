class Group < ActiveRecord::Base
	validates :name, presence:true
	has_many  :catalogs,dependent: :destroy
    has_many  :users
end
