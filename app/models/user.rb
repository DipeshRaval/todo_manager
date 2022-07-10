class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. Name : #{name}, E-mail : #{email} and Password : #{password}"
  end
end
