helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  @hamstagram_posts = HamstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end

get '/login' do    # when a GET request comes into /login
  erb(:login)      # render app/views/login.erb
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)  

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

get '/hamstagram_posts/new' do
  @hamstagram_post = HamstagramPost.new
  erb(:"hamstagram_posts/new")
end

post '/hamstagram_posts' do
  photo_url = params[:photo_url]

  @hamstagram_post = HamstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @hamstagram_post.save
    redirect(to('/'))
  else
    erb(:"hamstagram_posts/new")
  end
end

get '/hamstagram_posts/:id' do
  @hamstagram_post = HamstagramPost.find(params[:id])   # find the finstagram post with the ID from the URL
  erb(:"hamstagram_posts/show")               # render app/views/finstagram_posts/show.erb
end

post '/comments' do
  # point values from params to variables
  text = params[:text]
  hamstagram_post_id = params[:hamstagram_post_id]

  # instantiate a comment with those values & assign the comment to the `current_user`
  comment = Comment.new({ text: text, hamstagram_post_id: hamstagram_post_id, user_id: current_user.id })

  # save the comment
  comment.save

  # `redirect` back to wherever we came from
  redirect(back)
end