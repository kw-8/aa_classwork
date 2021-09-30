class Question
  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL
    #need to create an object
    self.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT *
    FROM questions
    WHERE users_id = ?
    SQL
    #need to create an object
    question.map{|q| self.new(q)}
    # self.new(question.first)
  end

  def self.most_followed(n=1)
    QuestionFollows.most_followed_questions(n)
  end

  attr_reader :id, :title, :body, :users_id
  def initialize(hash)
    @id = hash['id']
    @title = hash['title']
    @body = hash['body']
    @users_id = hash['users_id']
  end

  def author 
    Users.find_by_id(self.id)
  end

  def replies 
    #finds replies to a question
    Replies.find_by_question_id(self.id)
  end

  def followers 
    QuestionFollows.followers_for_question_id(self.id)
  end

end