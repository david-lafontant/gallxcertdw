FactoryBot.define do
    factory :item do
    association :user, factory: :user
    sequence(:name) { |n| "item_#{n}name" }
    price {50.0}
    description { "Sample document content" }
    picture { Rack::Test::UploadedFile.new('spec/fixtures/files/test.png', 'image/png') }
  end
end
