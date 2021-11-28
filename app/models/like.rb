class Like < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :hamstagram_post
      
     
end