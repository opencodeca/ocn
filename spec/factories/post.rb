FactoryGirl.define do
  factory :post do
    user

    title { Faker::Lorem.sentence }
  end

  factory :url_post, parent: :post do
    url { Faker::Internet.http_url }
  end

  factory :text_post, parent: :post do
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_post, parent: :post do
    title nil
    url nil
    description nil
  end
end
