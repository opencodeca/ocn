FactoryGirl.define do
  factory :post do
    user

    title { Faker::Lorem.sentence }
    url { Faker::Internet.http_url }
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_post, parent: :post do
    title nil
    url nil
    description nil
  end
end
