class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  # put callbacks at the top of model
  # files for visibility
  # before_save runs after validation, so
  # this needs to be before_validation to
  # ensure it is called before valid?
  # is checked
  before_validation :make_title_case

  # this validation can be before_save
  # because it doesn't modify the model
  # itself and we wouldn't want to invoke
  # it if the model instance wasn't valid
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about_post
    # add code here
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
