FactoryBot.define do
  factory :comment do
    commentable { association(:task) }
    text { 'test' }
    commenter { 'user' }
  end

  factory :task do
    subject { 'MyString' }
    assignee { 'Test' }
    status { 'MyString' }
    description { 'MyText' }
    created_by { 'MyString' }
  end

  factory :user do
    email { 'dio@wuardo.com' }
    password { 123_456 }
  end
end
