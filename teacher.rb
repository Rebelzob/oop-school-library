class Teacher < Person
  # constructor
  def initialized(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # methods
  def can_use_services?
    true
  end
end
