#When /conversation main page/ do
#  conversations_path
#end

def path_to(page_name)
  case page_name  
  when /the home page/    
       visit login_path
  end
end
