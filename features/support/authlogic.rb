require "authlogic/test_case"

World(Authlogic::TestCase)
ApplicationController.skip_before_filter :require_no_user, :require_user
Before do
  activate_authlogic
end

