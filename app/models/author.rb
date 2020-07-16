class Author < ActiveRecord::Base
  validate :is_title_case
  before_validation :make_title_case
  has_many :posts

  def is_title_case
    if name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Name must be in title case")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end
end
