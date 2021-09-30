require 'sqlite3'
require 'singleton'
require 'byebug'
require_relative 'question'
require_relative 'user'
require_relative 'question_follows'
require_relative 'replies'
require_relative 'question_likes'
# module TableMethods 
#   def find_by(table_name, attribute, attribute_val)
#     #debugger 
#     QuestionsDatabase.instance.execute(<<-SQL, table_name: table_name)
#     SELECT *
#     FROM :table_name
#     WHERE id = 1
#     SQL
#   end
# end

#'questions' --> questions; 'id' --> id; id --> id; 

class QuestionsDatabase < SQLite3::Database 
  include Singleton


  def initialize
    #type translation allows results as hash to turn default array into hash
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end 


p q1 = Question.find_by_id(1)
p Replies.find_by_question_id(1)
p Replies.find_by_user_id(1)
p gw = Users.find_by_name("George", "Washington")
p gw_questions = gw.authored_questions
p gw.authored_replies
p gw_questions.first.author 
p gw_questions.first.replies 
p gw_questions.first.replies.first.author
p gw_questions.first.replies.first.question
p gw_questions.first.replies.first.parent_reply
p gw_questions.first.replies.first.child_replies
p QuestionFollows.followers_for_question_id(2)
p QuestionFollows.followed_questions_for_user_id(1)
p gw.followed_questions
p Question.find_by_id(2).followers
p QuestionFollows.most_followed_questions(3)
p Question.most_followed
p Question.most_followed(2)
p QuestionLikes.likers_for_question_id(2)
p QuestionLikes.num_likes_for_question_id(1)
p QuestionLikes.num_likes_for_question_id(2)
p QuestionLikes.liked_questions_for_user_id(1)