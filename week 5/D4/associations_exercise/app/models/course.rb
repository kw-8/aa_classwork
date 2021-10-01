# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

  has_many :enrollments,
    class_name: 'Enrollment',
    primary_key: :id,
    foreign_key: :course_id

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite_courses,
    class_name: 'Course',
    primary_key: :id,
    foreign_key: :prereq_id
    
  # foreign key prereq_id -> course belongs to instructor
  belongs_to :instructor,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :instructor_id

end
