class PostsCat < ApplicationRecord
	belongs_to :post
	belongs_to :cat
end
