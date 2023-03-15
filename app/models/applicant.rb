class Applicant < Employee
  after_create :create_initial_employment_event

  private

  def create_initial_employment_event
    employment_events.create!
  end
end
