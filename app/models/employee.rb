class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :file
  has_many :employment_events

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

  STATUSES = [
    :received,
    :in_review,
    :interview_scheduled,
    :offer_made,
    :hired,
    :rejected,
    :cancelled,
    :ended
  ].freeze

  STATUSES_ENUM = STATUSES.each_with_object({}){ |key, hash| hash[key] = key.to_s }

  after_create :send_welcome_employee_email

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :first_name,
            :middle_name,
            :last_name,
            :date_of_birth,
            :contact_number,
            :work_experience,
            :education,
            :role,
            :file,
            presence: true
  enum :status, STATUSES_ENUM, default: :received

  def full_name
    [first_name, middle_name, last_name].join(' ')
  end

  private

  def send_welcome_employee_email
    mailer_attrs = %w(
      email
      full_name
      date_of_birth
      contact_number
      work_experience
      education
      role
    )

    EmployeeMailer.with(employee: attributes.slice(*mailer_attrs)).welcome_employee_email.deliver_later
  end
end
