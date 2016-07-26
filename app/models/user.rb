class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable#, :recoverable
  has_many :notes, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) } # newest users

  validates :username, presence: true, length: { maximum: 20 } # usernames are ended at 20 chars.
  validates :profilepic, presence: true
end
