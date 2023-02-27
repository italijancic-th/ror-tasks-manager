class User < ApplicationRecord

  # Scope lambda functions definitions
  scope :sorted, -> { order(:last_name, :first_name) }

  # Define methods inside User model, in order to make skinny controllers
  # Adding bussines login into ours models
  def full_name
    [first_name, last_name].join(' ')
  end
  
  def last_name_first
    [last_name, first_name].join(', ')
  end
  
  def abbrev_name
    first_initial = first_name.downcase.chars.first
    [first_initial, last_name.downcase].join('')
  end
end
