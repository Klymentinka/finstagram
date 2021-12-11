class Like < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :hamstagram_post
      
    validates_presence_of :user, :hamstagram_post
end