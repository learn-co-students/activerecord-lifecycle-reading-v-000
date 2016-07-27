class Post < ActiveRecord::Base

  validate :is_title_case
  before_validation :make_title_case
  belongs_to :author

  private

  def is_title_case
    if title.split.any?{|word|word[0].upcase != word[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
