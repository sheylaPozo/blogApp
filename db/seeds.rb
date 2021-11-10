# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sheyla = User.create(name:"sheyla", photo: "https://avatarfiles.alphacoders.com/168/thumb-168030.gif", bio: "I am sheyla, I am passionate about programming. I like video games and movies")

sheyla_post_one = Post.create(title: "How to start your day?", text: "This is description of post that i want to share with you!", user:sheyla)
sheyla_post_two = Post.create(title: "Why counting cals is important for your weight balance?", text: "This is description of post that i want to share with you!!", user:sheyla)
sheyla_post_three = Post.create(title: "Fashion!", text: "This is description of post that i want to share with you!", user:sheyla)
sheyla_post_four = Post.create(title: "Easy steps for your to-do list!!", text: "This is description of post that i want to share with you!", user:sheyla)


sheyla_comment_one = Comment.create(text: "I really like this post", user:sheyla, post: sheyla_post_one)
sheyla_comment_two= Comment.create(text: "This topic helped me a lot", user:sheyla, post: sheyla_post_two)


sheyla_like_one = Like.create(user:sheyla, post: sheyla_post_one)
sheyla_like_two = Like.create(user:sheyla, post: sheyla_post_two)



Yve = User.create(name:"Yve", photo: "https://trello.com/1/cards/616017c69f234131a64e5ee2/attachments/618c08f2b1947276e279189e/download/image.png", bio: "I am Yve, I am passionate about baking. In my free time, I like Knitting, watching movies, going to the beach and enjoy the sun.")

Yve_post_one = Post.create(title: "Fitness is important!", text: "This is the description of the post that I want to share with you", user: Yve)
Yve_post_two = Post.create(title: "Do know how to cook?", text: "This is the description of the post that I want to share with you!", user: Yve)
Yve_post_three = Post.create(title: "One day you'll be in Germany!", text: "This is the description of the post that I want to share with you", user:Yve)
Yve_post_four = Post.create(title: "Think possitive to increase your health", text: "This is the description of the post that I want to share with you", user:Yve)

Yve_comment_one = Comment.create(text: "I find this topic very interessting", user:Yve, post: Yve_post_one)
Yve_comment_two= Comment.create(text: "I love your post", user:Yve, post: Yve_post_two)
Yve_comment_three = Comment.create(text:"Totally agree with you", user:Yve, post: sheyla_post_one)


Yve_like_one = Like.create(user:Yve, post: Yve_post_one)
Yve_like_two = Like.create(user:Yve, post: Yve_post_two)


Nick = User.create(name:"Nick", photo: "https://trello.com/1/cards/616017c69f234131a64e5ee2/attachments/618c08b7f2a5022fc49372ba/download/image.png", bio: "I am Nick, I am passionate about programming. In my free time, I like free-diving, climbing and enjoy the sun.")

Nick_post_one = Post.create(title: "The big secret to sucesss!", text: "This is description of post that i want to share with you!", user: Nick)
Nick_post_two = Post.create(title: "why is alcohol really bad for your body?", text: "This is description of post that i want to share with you!!", user: Nick)

Nick_comment_one = Comment.create(text: "This is my favourite post from you!", user:Nick, post: Nick_post_one)
Nick_comment_two= Comment.create(text: "Good said! Keep the vibes up!", user:Nick, post: Nick_post_two)

Nick_like_one = Like.create(user:Nick, post: Nick_post_one)
Nick_like_two = Like.create(user:Nick, post: Nick_post_two)