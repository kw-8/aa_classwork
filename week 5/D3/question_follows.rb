class QuestionFollows
  # include TableMethods

  def self.most_followed_questions(n)
    #fetches n most-followed questions
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT  questions_id
    FROM    questions JOIN question_follows 
            ON questions.id = question_follows.questions_id
    GROUP BY  questions_id
    ORDER BY  COUNT(question_follows.users_id) DESC 
    LIMIT ?
    SQL
    # questions.map{|hash| hash['questions_id'].nil? ? {'questions_id' => 0} : hash } use somehting like this if left outer join
    questions.map{|q_hash| Question.find_by_id(q_hash['questions_id'])}
  end

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_follows
    WHERE relationships = ?
    SQL
    #need to create an object
    
    question_follows.map{|follow_hash| self.new(follow_hash)}
  end

  def self.followers_for_question_id(question_id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users_id
    FROM question_follows
    WHERE questions_id = ?
    SQL
    
    question_follows.map{|hash| Users.find_by_id(hash['users_id'])}
    # question_follows.map{|follow_hash| self.new(follow_hash)}
  end

  attr_reader :relationships, :users_id, :questions_id
  def initialize(hash)
    @relationships = hash['relationships']
    @users_id = hash['users_id']
    @questions_id = hash['questions_id']
  end

  def self.followed_questions_for_user_id(usr_id)
    #returns an array of question objects
    questions = QuestionsDatabase.instance.execute(<<-SQL, usr_id)
    SELECT 
      questions_id
    FROM
    question_follows JOIN questions 
    ON question_follows.users_id = questions.users_id
    WHERE
      question_follows.users_id = ?
    SQL

    questions.map{|q_hash| Question.find_by_id(q_hash["questions_id"]) }

  end
end