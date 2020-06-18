class Post < ApplicationRecord
has_one_attached :post_picture
belongs_to :user

end
