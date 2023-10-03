class Teacher < Person
  # constructor
  def initialized(specialization)
    super(id, age, name, parent_permission: true)
    @specialization = specialization
  end

  # methods
  def can_use_services?
    true
  end
end
