FactoryGirl.define do
  factory :comment do
    comment { Faker::Lorem.paragraph }

    association :commenter, factory: :user
    association :commentable, factory: :url_post
  end

  factory :invalid_comment, parent: :comment do
    comment nil
  end
end
