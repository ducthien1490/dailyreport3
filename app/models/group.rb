class Group < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50,minimum:5}
end
