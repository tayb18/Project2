class User < ActiveRecord::Based
  has_many :articles
end