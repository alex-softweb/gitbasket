def run_cucumber
  puts "==================================="
  print "          "
  system "date '+%H:%M:%S'"
  puts "==================================="
  system "cucumber --drb features/"
end

[
"features/[^']*/[^']+_steps\.rb",
#"app/[^']*/[^']+\.rb",
"features/[^']+\.feature"
].each do |file|
  watch(file) { run_cucumber }
end
