require 'faker'

FactoryGirl.define do
  factory :comment do |f|
    f.body { Faker::Lorem.sentences(4) }
    
  end
end