class SqlController < ApplicationController
  def index
    @test1 = User.find_by_sql("
      SELECT username, email FROM users
      INNER JOIN tasks ON users.id = tasks.user_id
      WHERE tasks.status = 'Done'
      GROUP BY users.id
      HAVING COUNT(tasks.status) > 2
      ")
    # Could not handle with SQL tasks.
  end
end
