FactoryBot.define do
  factory :task do
    name { 'test_name1' }
    description { 'test_description1' }
    deadline { Time.current.since(20.day) }
    status { '未着手' }
    priority { '低' }
    # association :user
  end
  factory :second_task, class: Task do
    name { 'test_name2' }
    description { 'test_description2' }
    deadline { Time.current.since(10.day) }
    status { '着手中' }
    priority { '高' }
    # association :user
  end
  factory :third_task, class: Task do
    name { 'test_name3' }
    description { 'test_description3' }
    deadline { Time.current }
    status { '完了' }
    priority { '中' }
    # association :user
  end
end