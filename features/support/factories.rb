#require 'factory_girl'
#require 'factory_girl/step_definitions'


Factory.define(:user) do |t| 
  t.first_name "test" 
  t.last_name "test"
  t.email "test@tester.com"
  t.password "test123"
  t.password_confirmation "test123"
end

Factory.define(:tester) do |t| 
  t.first_name "test2" 
  t.last_name "test2"
  t.email "email@example.com"
  t.password "test133"
  t.password_confirmation "test133"
#  t.id 1
#  t.crypted_password "7dde901231571dd5a079a58b099cb5f705fe99643d718ab8dee..."
#  t.password_salt "6d9qut9xdv1pQK6O8554"
#  t.persistence_token "7983fbd8167a3368b639a31926d888d93e171613b214c3500e4..."
#  t.single_access_token "416OE0qpHNEmk7vUK4h"
#  t.perishable_token "AIG6M9vLoTjU6Q8IjGMw"
#  t.login_count 31
#  t.failed_login_count 0
#  t.last_request_at "2011-12-09 07:05:30"
#  t.current_login_at "2011-12-09 07:05:22"
#  t.last_login_at "2011-12-09 07:04:21"
#  t.current_login_ip "192.168.3.113"
#  t.last_login_ip "127.0.0.1"
#  t.created_at "2011-12-07 11:36:01"
#  t.updated_at "2011-12-09 07:05:30"
end  

