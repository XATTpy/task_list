FactoryBot.define do
  factory :user do
    email { 'dio@gmail.com' }
    password { 'warudo' }
  end

  factory :admin do
    email { 'jojo@gmail.com' }
    password { '12345678' }
  end

  factory :task do
    subject { 'Make Pizza' }
    assignee { 'Joe' }
    status { 'To Do' }
    description { 'I need pizza' }
    created_by { 'Kujo' }
    type { 'Issue' }
  end

  factory :comment do
    commentable { association(:task) }
    text { 'test' }
  end
end
