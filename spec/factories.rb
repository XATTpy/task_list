FactoryBot.define do
  factory :admin do
    name { 'Kujo' }
    surname { 'Jotaro' }
    email { 'jojo@gmail.com' }
    password { '12345678' }
  end

  factory :user do
    name { 'Dio' }
    surname { 'Brando' }
    email { 'dio@gmail.com' }
    password { 'warudo' }
  end

  factory :task do
    admin { association(:admin) }
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
