4.times do
    User.create([{
        email: Faker::Internet.email,
        password: 123456
        }])
end

users = []; for user in User.all; users.append(user.username); end

2.times do
    User.create([{
        email: Faker::Internet.email,
        password: 123456,
        admin: true
        }])
end

admins = []; for admin in User.where(admin: true).find_each; admins.append(admin.username); end

20.times do
    Task.create([{
        subject: Faker::Job.title,
        assignee: users.sample,
        description: Faker::Job.field,
        status: ["To Do", "In Progress", "In Review", "Done"].sample,
        created_by: admins.sample
        }])
end

users += admins
commentable = []; for task in Task.all; commentable.append({commentable_type: 'Task', commentable_id: task.id}); end

40.times do
    commentable_record = commentable.sample
    Comment.create([{
        commenter: users.sample,
        text: Faker::Food.description,
        commentable_type: commentable_record[:commentable_type],
        commentable_id: commentable_record[:commentable_id]
        }])
    comment = Comment.last
    commentable.append({commentable_type: 'Comment', commentable_id: comment.id})
end
