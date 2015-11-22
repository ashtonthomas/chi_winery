FactoryGirl.define do
  sequence :wine_name do |n|
    "FactoryWine#{n}"
  end

  factory :wine do |b|
    name {FactoryGirl.generate(:wine_name)}
    vintage 1988
  end
end
