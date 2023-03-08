class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  WORK_EXPERIENCE = [
    "less_than_one_year",
    "one_to_two_years",
    "three_to_five_years",
    "five_years_or_more"
  ].freeze

  EDUCATION = [
    "undergraduate",
    "elementary",
    "high_school",
    "college",
    "masters",
    "doctorate"
  ].freeze

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  validates :first_name,
            :middle_name,
            :last_name,
            :date_of_birth,
            :contact_number,
            :work_experience,
            :education,
            :role,
            presence: true
end