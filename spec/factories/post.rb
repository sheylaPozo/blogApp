FactoryBot.define do
  factory :post do
    title { 'post 1' }
    text { 'post 1 content' }
    user

    factory :post_with_comments do
      transient do
        no_of_comments { 5 }
      end
      after(:build) do |post, evaluator|
        create_list(:comment, evaluator.no_of_comments, post: post)
      end
    end

    factory :post_with_likes do
      transient do
        no_of_users { 2 }
      end
      after(:create) do |post, evaluator|
        create_list(:like, evaluator.no_of_users, post: post)
      end
    end
  end
end
