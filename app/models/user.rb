class User < ActiveRecord::Base

    has_many :hamstagram_posts
    has_many :comments
    has_many :likes

end