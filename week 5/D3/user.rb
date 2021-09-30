class Users
  def self.find_by_id(id)
    #should look up and ID in the table and return an object represeting a row
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    self.new(users.first)
  end

  def self.find_by_name(fname, lname)
    #should look up and ID in the table and return an object represeting a row
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT *
    FROM users
    WHERE fname = ? AND lname = ?
    SQL

    self.new(users.first)
  end

  attr_reader :id, :fname, :lname
  def initialize(hash)
    @id = hash['id']
    @fname = hash['fname']
    @lname = hash['lname']
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies 
    Replies.find_by_user_id(self.id)
  end

  def followed_questions 
    QuestionFollows.followed_questions_for_user_id(self.id)
  end

end