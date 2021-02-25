FactoryBot.define do
  factory :task do
    name { 'test_name1' }
    description { 'test_description1' }
    deadline { Time.current.since(10.day) }
    status { '未着手' }
    priority { '低' }
  end
  factory :second_task, class: Task do
    name { 'test_name2' }
    description { 'test_description2' }
    deadline { Time.current }
    status { '未着手' }
    priority { '高' }
  end
end