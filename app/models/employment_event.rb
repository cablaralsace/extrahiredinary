class EmploymentEvent < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :employee

  after_create :update_employee_status

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

  enum :status, STATUSES_ENUM, default: :received

  def status_translation
    I18n.t("employment_event.status.#{status}")
  end

  private

  def update_employee_status
    employee.update(status:)
  end
end
