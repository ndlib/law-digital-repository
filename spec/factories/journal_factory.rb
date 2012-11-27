# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :journal do
    sequence(:name) {|n| "Journal Name #{n}"}
  end
  factory :invalid_journal, parent: :journal do
    name ''
  end
end
