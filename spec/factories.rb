FactoryBot.define do
  factory :comment do
    
  end

  factory :task do
    subject { "MyString" }
    assigne { "MyString" }
    status { "MyString" }
    description { "MyText" }
    created_by { "MyString" }
  end

  factory :user do
    
  end

end
