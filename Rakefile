desc 'build the gem'
task :build do
  system "gem build winrm.gemspec"
end

desc 'push the gem to rubygems.org'
task :release => :build do
  version = File.open('VERSION').readline.chomp
  system "gem push bundler-#{version}"
end
