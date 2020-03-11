class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  before_validation :make_title_case
  # use before_validation when modifying an attribute of the model
  # before_save => any other action
  # before_create => similar to before_save, however, only gets called when the model is created for the FIRST TIME
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def email_author_about_post
  end
end
