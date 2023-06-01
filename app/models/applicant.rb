class Applicant < Employee
  after_create :create_initial_employment_event
  after_save :update_type

  private

  def create_initial_employment_event
    employment_events.create!
  end

  def update_type
    if self.hired?
      update_column(:type, Employee.name)
    end
  end
end
