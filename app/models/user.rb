class User < ApplicationRecord
  has_many :todos

  def to_pleasant_string
    "#{id}. firstName : #{first_name}, lastName: #{last_name},E-mail : #{email}"
  end
end
