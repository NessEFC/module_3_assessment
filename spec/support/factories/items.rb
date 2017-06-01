FactoryGirl.define do
  factory :item do
    name { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
    image_url { Faker::Internet.url }
  end
end
