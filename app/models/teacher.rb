class Teacher < User
  has_many :lessons, class_name: 'Lesson', foreign_key: 'teacher_id'
  has_attachments :photos, maximum: 3
  validates_presence_of :experience, :description

end
