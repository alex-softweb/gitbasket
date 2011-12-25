
Factory.define(:user) do |t| 
  t.first_name "test" 
  t.last_name "test"
  t.email "something@examp.com"
  t.user_type "user"
  t.password "test123"
  t.password_confirmation "test123"
end

Factory.define(:conversation) do |c|
  c.id 1
  c.subject "This is a factored conversation"
  c.description "Factories are good for creating mock data"
end  


