class Post < ActiveRecord::Base

  validate :is_title_case 
  before_validation :make_title_case 
  belongs_to :author

  before_save :tell_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def tell_author_about_post
    puts "Post saved into db!"
  end
end
