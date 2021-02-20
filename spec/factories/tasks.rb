FactoryBot.define do
  factory :task do
    name { 'test_name1' }
    description { 'test_description2' }
    id { 1 }
  end
  factory :second_task, class: Task do
    name { 'test_name2' }
    description { 'test_description2' }
    id { 2 }
  end
end