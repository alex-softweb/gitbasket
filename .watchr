def run_cucumber
  puts "==================================="
  print "          "
  system "date '+%H:%M:%S'"
  puts "==================================="
  system "cucumber --drb features/ --tags @run"
end

[
"features/.*/.+_steps\.rb",
#"app/.*/.+\.rb",
"features/.+\.feature"
].each do |file|
  watch(file) { run_cucumber }
end

#watch("test/.*/.+\.rb") { system "rake test"}

watch("spec/.*/.*_spec.rb") do |path| 
  system "rspec #{path}"
end
