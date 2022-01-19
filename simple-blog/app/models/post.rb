class Post < ApplicationRecord
	has_many :comments, :dependent => :delete_all
        belongs_to :user
        has_one_attached :image
end
