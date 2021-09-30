class QuestionLikes
  # include TableMethods

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_likes
    WHERE id = ?
    SQL
    #need to create an object
    self.new(question_likes.first)
  end

  def self.likers_for_question_id(question_id)
    questions_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users_id
    FROM question_likes JOIN users
      ON question_likes.users_id = users.id
    WHERE questions_id = ?
    SQL
    questions_likes.map{|hash| Users.find_by_id(hash["users_id"])}
  end

  def self.num_likes_for_question_id(question_id)
    questions_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT COUNT(users_id)
    FROM question_likes JOIN users
      ON question_likes.users_id = users.id
    WHERE questions_id = ?
    SQL
    questions_likes.first["COUNT(users_id)"]
  end

  def self.liked_questions_for_user_id(users_id)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT questions_id
    FROM question_likes
    WHERE users_id = ?
    SQL
    liked_questions.map{|hash| Question.find_by_id(hash["questions_id"])}
  end

  attr_reader :id, :users_id, :question_id
  def initialize(hash)
    @id = hash['id']
    @question_id = hash['questions_id']
    @users_id = hash['users_id']
  end
end