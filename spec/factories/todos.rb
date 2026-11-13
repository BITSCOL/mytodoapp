FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    completed { false }
  end
end
