FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    user
    group
  end
end