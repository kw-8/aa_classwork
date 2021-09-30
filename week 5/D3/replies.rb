class Replies
  # include TableMethods

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL
    #need to create an object
    self.new(reply.first)
  end

  def self.find_by_user_id(users_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT *
    FROM replies
    WHERE users_id = ?
    SQL
    replies.map{|reply| self.new(reply)} unless replies.empty?
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM replies
    WHERE questions_id = ?
    SQL
    replies.map{|reply| self.new(reply)}
  end

  def self.find_by_parent(parent_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
    SELECT *
    FROM replies
    WHERE parent_id = ?
    SQL
    replies.map{|reply| self.new(reply)} unless replies.empty?
  end


  attr_reader :id, :body, :users_id, :questions_id, :parent_id
  def initialize(hash)
    @id = hash['id']
    @body = hash['body']
    @questions_id = hash['questions_id']
    @users_id = hash['users_id']
    @parent_id = hash['parent_id']
  end

  def author
    Users.find_by_id(self.users_id)
  end

  def question
    Question.find_by_author_id(self.users_id)
  end 

  def parent_reply
    pr = Replies.find_by_user_id(self.parent_id) 
    pr.nil? ? nil : pr 
  end

  def child_replies
    Replies.find_by_parent(self.id)
  end

end