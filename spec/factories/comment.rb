FactoryBot.define do
  sequence(:text) { |n| "Comment#{n}" }
  factory :comment do
    user
    post
    text
  end
end
