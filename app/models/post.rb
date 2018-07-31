class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  # before_save :make_title_case #occurs just before save to db.
  before_validation :make_title_case #occurs before BOTH validation and save to db.
  # before_save :email_author_about_post #author is alerted after validation and just prior to db alteration.
  #before_create will run similarly to before_save, but only upon the intitial creation of an object.

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
