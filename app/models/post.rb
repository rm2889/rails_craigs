class Post < ActiveRecord::Base
  validates :title, :description, :price, presence: true

  belongs_to :category
  belongs_to :user
end
