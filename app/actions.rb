get '/' do

  @hamstagram_posts = HamstagramPost.order(created_at: :desc)
    
  erb(:index)
end