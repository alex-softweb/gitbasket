
# This loads some niceties for irb, courtesy of rvm.
# It also loads your custom ~/.irbrc if it exists.
# If you want to customize the irbrc for ONLY this version of
# ruby then edit this file. It will only be deleted if you do
# an "rvm install" over this ruby version.

if ENV["rvm_path"].nil?
  require File.join(ENV["HOME"], "irbrc")
else
  require File.join(ENV["rvm_path"], "scripts", "irbrc")
end

IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :PROMPT_I => "%02n: ",            # normal prompt
  :PROMPT_S => ">>  ",             # prompt for continuing strings
  :PROMPT_C => "%02i> ",             # prompt for continuing commands
  :PROMPT_N => "%02i> ",
  :RETURN => "=>  %s\n"        # format return value
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT
