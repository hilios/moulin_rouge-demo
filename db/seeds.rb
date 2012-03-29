User.find_or_create_by_email("admin@moulinrouge.com", :password => "1234")

MoulinRouge.roles.each do |role|
  Role.find_or_create_by_name(role)
end