# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "email#{n}@email.com" }
  sequence(:name) { |n| "User#{n}" }

  factory :user do
    name
    email
    bio { 'My short bio' }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }

    factory :is_admin do
      role { 'admin' }
    end

    factory :user_with_posts do
      transient do
        no_of_posts { 5 }
      end
      after(:build) do |user, evaluator|
        create_list(:post, evaluator.no_of_posts, user: user)
      end
    end
  end
end
