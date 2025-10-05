require "json"
require "rest-client"

response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response).first(30)

puts "Nettoyons la DB"

Post.destroy_all
Comment.destroy_all
User.destroy_all
React.destroy_all
Vote.destroy_all

puts "Création des posts avec l'API Hacker News"

repos.each do |repo|
  url = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{repo}.json"
  response = JSON.parse(url)
  post = Post.new(
    title: response["title"],
    post_type: response["type"],
    url: response["url"],
    vote_count: response["score"],
    author: response["by"]
  )
  post.save!
end

puts "#{Post.count} posts créés"


puts "Création d'un user"

User.create!(
  email: "laitue@laitue.com",
  password: "123456",
  username: "laitue"
  )

  puts "#{User.count} user créé"

Comment.create!(
  content: "C'est un super post !",
  post: Post.order(vote_count: :desc).first,
  user: User.first
)

puts "#{Comment.count} commentaire créé"

React.create!(
  emoji: "👍",
  user: User.first,
  comment: Comment.first
)

puts "#{React.count} réaction créée"
