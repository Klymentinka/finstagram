class User < ActiveRecord::Base

    # Data relationship
    
    has_many :hamstagram_posts
    has_many :comments
    has_many :likes
    
    # Data validation

    validates :email, :username, uniqueness: true
    validates :email, :avatar_url, :username, :password, presence: true
  

end