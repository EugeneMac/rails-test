require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Lorem.characters(8) }
    f.text { Faker::Lorem.sentences(3) }
    
  end
end