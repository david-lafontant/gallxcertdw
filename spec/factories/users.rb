FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    role {1}
    confirmed_at { Time.zone.now - 1.hour }
    confirmation_sent_at { Time.zone.now - 1.hour }
    confirmation_token { "abcd1234" }

  end
end
