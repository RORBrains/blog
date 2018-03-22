Comment.destroy_all
Post.destroy_all
User.destroy_all

def random_name
  "#{FFaker::Internet.user_name}#{Time.new.to_i}"[0..16]
end

# Users
hash_users = 10.times.map do
  {
    name:  random_name,
    email: FFaker::Internet.safe_email
  }
end
users = User.create!(hash_users)
users.first(7).each { |u| u.update(creator: true) }
users.first(2).each { |u| u.update(moderator: true) }

# Posts
creators = User.where(creator: true)
hash_posts = 20.times.map do
  {
    title: FFaker::HipsterIpsum.paragraph,
    body: FFaker::HipsterIpsum.paragraph,
    user: creators.sample
  }
end
posts = Post.create!(hash_posts)

# Comments
hash_comments = 200.times.map do
  {
    body: FFaker::HipsterIpsum.paragraph,
    post: posts.sample,
    user: creators.sample
  }
end
Comment.create!(hash_comments)




