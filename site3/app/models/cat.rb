class Cat < ApplicationRecord
	has_many :posts_cats
	has_many :posts, :through => :posts_cats

end
