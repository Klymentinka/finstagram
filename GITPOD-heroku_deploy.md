Deploying Finstagram to Heroku
These instructions will help you deploy your Finstagram app to Heroku (a web hosting service), so that the entire internet will be able to see and interact with your application! Before we get to deployment though, we need to make sure a couple of our files are setup properly.

If you've already deployed and want to continue making changes, see the Making Changes section near the bottom.

Pre-Deployment: Push to Remote Repo and Merge Changes
In the terminal, type git branch
If you're not on the master branch
Take note of your current branch
Type these commands:
git add .
git commit -m "pre-deployment"
git push
git checkout master
git merge NAME_OF_NOTED_BRANCH
Continue on with Readies for Deployment: Add Heroku CLI
Otherwise
git add .
git commit -m "pre-deployment"
git push
Pre-Deployment: Create Seed Data
Create a seeds.rb file in the db folder
Copy the following into that file:
users = [
  { username: "sharky_j", avatar_url: "http://naserca.com/images/sharky_j.jpg", email: "sharky_j@gmail.com", password: "abcd" },
  { username: "kirk_whalum", avatar_url: "http://naserca.com/images/kirk_whalum.jpg", email: "kirk_w@gmail.com", password: "abcd" },
  { username: "marlin_peppa", avatar_url: "http://naserca.com/images/marlin_peppa.jpg", email: "marlin_p@gmail.com", password: "abcd" }
]

finstagram_posts = [
  { photo_url: "http://naserca.com/images/shark.jpg"},
  { photo_url: "http://naserca.com/images/whale.jpg"},
  { photo_url: "http://naserca.com/images/marlin.jpg"}
]

puts "Seeding database..."

# create Users and FinstagramPosts
users.each_with_index do |user, index|
  # create new User
  user_record = User.create(user)
  # get a finstagram_post
  finstagram_post = finstagram_posts[index]
  # modify finstagram_post's user_id from created record
  finstagram_post[:user_id] = user_record.id
  # create new FinstagramPost
  FinstagramPost.create(finstagram_post)
end

puts "Seeding complete."
Readies for Deployment: Add Heroku CLI
In a terminal type the following and press enter:

npm i -g heroku
Readies for Deployment: Edit Your Gemfile
Ensure your Gemfile file contains the following code (should match exactly).

Pay attention to: new group :production and the pry gem is no longer in a group

source "https://rubygems.org"

gem 'rake'
gem 'activesupport'
gem 'activerecord', '< 6.1.0'
gem 'bcrypt'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'
gem 'tux'
gem 'pry'

group :development, :test do
  gem 'shotgun'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
After saving the Gemfile changes,

Delete your Gemfile.lock file
In a terminal type bundle install
Readies for Deployment: Edit Your Database File
Ensure your config/database.rb file contains the following codes (should match exactly).

Important things that are different: if/else block for different database definition

configure do
  # Log queries to STDOUT in development
 if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    db = URI.parse(ENV['DATABASE_URL'])
    set :database, {
      adapter: "postgresql",
      host: db.host,
      username: db.user,
      password: db.password,
      database: db.path[1..-1],
      encoding: "utf8"
    }
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
Readies for Deployment: Edit Your Migrate File
Ensure your db/migrate/0_create_base_tables.rb file contains the following codes (should match exactly).

Only difference is the first line. Specifically the brackets with a version number

class CreateBaseTables < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :finstagram_posts do |t|
      t.references :user
      t.string :photo_url
      t.timestamps
    end

    create_table :comments do |t|
      t.references :user
      t.references :finstagram_post
      t.text :text
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :finstagram_post
      t.timestamps
    end

  end

end
Deploying Finstagram to Heroku
1. Create an account at heroku.com.

Make sure you remember your login email and password!
Heroku will ask you to confirm your email (which you have to do before your account is active/usable).
2. Go back to Gitpod, and in a terminal tab, type the following and hit enter:

heroku login -i
Enter your login credentials
If it worked, it will say something like Logged in as you@youremail.com
Next, still in your terminal tab, type this and press enter: heroku create
Copy the URL that it spits out- this will be how you'll access your application once it's deployed! The URL should look like https://stark-reef-21398.herokuapp.com/
If you want to rename your app, enter: heroku apps:rename [new-app-name]
3. Still in your terminal tab

Run the command heroku addons:create heroku-postgresql:hobby-dev
If you receive Couldn't find that app. (Otherwise go to step 4)
Type: heroku git:remote -a YOUR-APP-NAME (The app name is the two random words followed by some numbers in the URL). Press enter.
4. Then save your code using git:

a) git status
b) git add .
c) git commit -m "Readies app for deployment"
5. Still in the terminal tab, launch your app by typing: git push heroku

6. Still in the terminal tab, run the db migration with this command: heroku run bundle exec rake db:migrate

7. Lastly, seed data into the database with the following: heroku run bundle exec rake db:seed

Seeing Your Live App!
Remember the URL you wrote down after you did heroku create? Yep, now is the time to get out that link and try visiting it in your browser! If you did everything correctly, it should load your Finstagram app :)

Making your changes available on GitHub
In your terminal type git push origin master

You will be prompted to login to your GitHub account, along with the password (the cursor will not move when you enter your password). When you're done typing your password, hit enter.

Post-deployment
Making Changes
Once your app is live, you can still make changes to your code and add new features! You can make your changes in Gitpod as you would normally, then once you're done, make sure all your changes are saved.

If you're starting up your gitpod workspace again, you'll need to do a couple initial steps to connect heroku first:

In the terminal, type: npm i -g heroku
After it's installed, and still in the terminal, type: heroku login -i
Log in to Heroku with your credentials
Now you're ready to continue working on your app!
After you've made some changes and tested them locally to ensure your app is working, follow the next steps to push your changes to heroku.

1. Open a terminal tab, and record your changes with Git:

a) git status
b) git add .
c) git commit -m "Description of your changes."
2. Still in the terminal tab, push your changes

a) to Heroku: git push heroku
b) to GitHub: git push origin master
3. Go back to your Heroku app, refresh the page, and your changes will be live!

Using Tux on Heroku
When developing your app on Gitpod, you were able to do bundle exec tux to edit things in your database and just generally play around with ruby code. Once your app is deployed to Heroku, using tux won't change things on the Heroku version of your app, it'll only change them on Gitpod.

To make changes to data in the database of your Heroku app, you should go into Gitpod, open a new terminal tab, and then run this command:

heroku run bundle exec tux
(and then you can use tux as you normally would)

Links & References
https://devcenter.heroku.com/articles/rack
https://devcenter.heroku.com/articles/git
https://devcenter.heroku.com/categories/heroku-postgres
http://www.sinatrarb.com/documentation.html
