class Group < ActiveRecord::Base
	validates :name, presence:true
	has_many  :catalogs, dependent: :destroy
    has_many  :users
    accepts_nested_attributes_for :catalogs
end
