class Author < ActiveRecord::Base
  has_many :posts

  def make_title_case
  self.title = self.title.titlecase
end
end
