class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :employment_events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  def full_name
    [first_name, last_name].join(' ')
  end
end
