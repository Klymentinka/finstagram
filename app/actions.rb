def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

get '/' do

  @hamstagram_post_hammy = {
    username: "hammy_j",
    avatar_url: "https://sdl-stickershop.line.naver.jp/products/0/0/1/1046635/android/stickers/1947077.png",
    photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ361flrQzAgTMvexAumBJcYdirX8f5uZ1ks1ejpPtoF2qEmB3KRoIcWRLcwoP1d7IMPq8&usqp=CAU1",
    humanized_time_ago: humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "hammy_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  @hamstagram_post_kirk = {
    username: "kirk_ham",
    avatar_url: "https://i.pinimg.com/originals/ec/7e/46/ec7e46a7e3f08f9b2c1762fae1f86ead.jpg",
    photo_url: "https://cdn.mos.cms.futurecdn.net/96MvxQEmF5YkjSXGebZoeN.jpg",
    humanized_time_ago: humanized_time_ago(60),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_ham",
      text: "#weekendvibes"
    }]
  }

  @hamstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "https://i.pinimg.com/originals/74/5c/7d/745c7daad275266fbbc11ca609c772a9.jpg",
    photo_url: "https://cryptoglobe.s3.eu-west-2.amazonaws.com/2021/10/cute-golden-hamster-768x512.jpg",
    humanized_time_ago: humanized_time_ago(180),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)!"
    }]
  }

  @hamstagram_posts = [@hamstagram_post_hammy, @hamstagram_post_kirk, @hamstagram_post_marlin]
  
  erb(:index)
end