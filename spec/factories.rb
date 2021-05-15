FactoryBot.define do
  factory :pizza do
    type 'pepperoni'
  end

  factory :person do
    name 'Joe'
  end

  factory :pizzas_consumptions do
    eaten_at '2015-01-02 00:00:00'
    association :pizza, factory: :pizza
    association :person, factory: :person
  end

end