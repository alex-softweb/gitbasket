def run_cucumber
  puts "==================================="
  print "          "
  system "date '+%H:%M:%S'"
  puts "==================================="
  system "cucumber --drb features/ --tags ~@skip"
end

[
"features/[^']*/[^']+_steps\.rb",
"features/[^']+\.feature",
"app/[^']*/[^']+\.rb"
].each do |file|
  watch(file) { run_cucumber }
end
