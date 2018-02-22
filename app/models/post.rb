class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 
  
  before_validation :make_title_case 
  #before_save :email_author_about_post
  #before_save is also an option
  #Whenever you are modifying an attribute of the model, use before_validation. If you are doing some other action, then use before_save
  #Now let's do something that belongs in the before_save. We use before_save for actions that need to occur that aren't modifying the model itself. For example, whenever you save to the database, let's send an email to the Author alerting them that the post was just saved!
  
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
