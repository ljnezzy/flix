class User < ApplicationRecord
	has_secure_password

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorite_movies, through: :favorites, source: :movie

	validates :email, presence: true,
	                format: /\A\S+@\S+\z/,
	                uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 5, allow_blank: true }

	def self.authenticate(email, password)
	  user = User.find_by(email: email)
	  user && user.authenticate(password)
	end
end
