class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	acts_as_likeable
	validates_length_of :content, allow_blank: false
end
