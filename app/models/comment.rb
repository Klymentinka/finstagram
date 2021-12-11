class Comment < ActiveRecord::Base

    # Associations from a previous exercise
    belongs_to :user
    belongs_to :hamstagram_post

    # New validation code
    validates_presence_of :text, :user, :hamstagram_post
  
  end