FactoryGirl.define do
  factory :comment do
    comment { Faker::Lorem.paragraph }
  end

  factory :invalid_comment, parent: :comment do
    comment nil
  end
end
