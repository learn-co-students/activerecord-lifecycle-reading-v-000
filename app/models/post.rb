class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  #When modifying an attribute of the model, use before_validation. 
  #If you are doing some other action, then use before_save.
  before_validation :make_title_case 

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
