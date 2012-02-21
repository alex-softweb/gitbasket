# Ways to execute a shell script

cmd = "ls" # Sample string that can be used

# 1. Kernel#` - commonly called backticks - `cmd` 
# This is like many other languages, including bash, PHP, and Perl
#  Returns the result of the shell command
#  Docs: http://ruby-doc.org/core/classes/Kernel.html#M001111

value = `echo 'hi'`
value = `#{cmd}`


# 2. Built-in syntax, %x( cmd )
# Following the ``x'' character is a delimiter, which can be any character.
# If the delimiter is one of the characters ``('', ``['', ``{'', or ``<'',
# the literal consists of the characters up to the matching closing delimiter,
# taking account of nested delimiter pairs. For all other delimiters, the
# literal comprises the characters up to the next occurrence of the
# delimiter character.  String interpolation #{ ... } is allowed.
#   Returns the result of the shell command, just like the backticks
#   Docs: http://www.ruby-doc.org/docs/ProgrammingRuby/html/language.html

value = %x( echo 'hi' )
value = %x[ #{cmd} ]


# 3. Kernel#system
# Executes the given command in a subshell, 
#   Return: true if the command was found and ran successfully, false otherwise
#   Docs: http://ruby-doc.org/core/classes/Kernel.html#M002992

wasGood = system( "echo 'hell'" )
wasGood = system( cmd )


# 4. Kernel#exec
# Replaces the current process by running the given external command.
#   Return: none, the current process is replaced and never continues
#   Docs: http://ruby-doc.org/core/classes/Kernel.html#M002992

exec( "echo 'hi'" )
exec( cmd ) # Note: this will never be reached beacuse of the line above


# Extra Advice
# $? which is the same as $CHILD_STATUS
# Accesses the status of the last system executed command if
# you use the backticks, system() or %{}.
# You can then access the ``exitstatus'' and ``pid'' properties

$?.exitstatus

# More Reading
# http://www.elctech.com/blog/i-m-in-ur-commandline-executin-ma-commands
# http://blog.jayfields.com/2006/06/ruby-kernel-system-exec-and-x.html

