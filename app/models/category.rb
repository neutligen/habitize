class Category < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :category_name, presence: true

end
