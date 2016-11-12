class Post < ApplicationRecord

	has_many :comments

	has_many :posts_cats
	has_many :cats, :through => :posts_cats

	belongs_to :user
	
end
