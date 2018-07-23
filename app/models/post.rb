class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 
  
  # New Code!!
  before_validation :make_title_case 
  
  # New Code!!
  # before_save :email_author_about_post

  
  # Here is a rule of thumb: Whenever you are modifying an attribute of the model, use before_validation. If you are doing some other action, then use before_save.


  # New Code!!
  # before_create :some_method

  # Difference between before_save and before_create is the latter gets called only when a new object is being created


  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
