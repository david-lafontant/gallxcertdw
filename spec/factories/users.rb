FactoryBot.define do
    factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }

    confirmed_at { Time.current }
    before(:create) { |user| user.skip_confirmation! }
  end
end
