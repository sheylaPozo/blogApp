# frozen_string_literal: true

FactoryBot.define do
  sequence(:text) { |n| "Comment#{n}" }
  factory :comment do
    user
    post
    text
  end
end
