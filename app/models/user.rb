# class User < ApplicationRecord
#   has_secure_password
#   has_many :sessions
#   validates :username, presence: true, length: { minimum: 3, maximum: 64 }
#   validates :password, presence: true, length: { minimum: 8, maximum: 64 }
#   validates_uniqueness_of :username
# end

# class User < ApplicationRecord
#   has_many :sessions, dependent: :destroy
#   has_many :tasks, dependent: :destroy
#
#   validates :username, presence: true, length: { minimum: 3, maximum: 64 }
#   validates :password, presence: true, length: { minimum: 8, maximum: 64 }
#   validates :email, presence: true, length: { minimum: 5, maximum: 500 }
# end

class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 64 }
  validates :password, presence: true, length: { minimum: 8, maximum: 64 }
  validates_uniqueness_of :username
end
