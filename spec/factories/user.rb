FactoryGirl.define do
  factory :user, aliases: [:commenter] do
    email { Faker::Internet.email }
    provider 'github'
    uid { SecureRandom.hex }
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    gravatar_id { SecureRandom.hex }
  end

  factory :invalid_user, parent: :user do
    email nil
    provider nil
    uid nil
    name nil
    username nil
    gravatar_id nil
  end

  factory :user_with_posts, parent: :user do
    after(:create) do |user|
      FactoryGirl.create_list(:post, 2, user: user)
    end
  end
end
