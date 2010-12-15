Gem::Specification.new do |gem|
  gem.name = "winrm"
  gem.version = File.open('VERSION').readline.chomp
  gem.platform = Gem::Platform::RUBY
  gem.rubyforge_project  = nil

  gem.author = "Dan Wanek"
  gem.email = "dan.wanek@gmail.com"
  gem.homepage = "http://github.com/zenchild/WinRM"

  gem.summary = 'Ruby library for Windows Remote Management'
  gem.description	= <<-EOF
    Ruby library for Windows Remote Management
  EOF

  gem.files = `git ls-files`.split(/\n/)
  gem.require_path = "lib"
  gem.rdoc_options	= %w(-x test/ -x examples/)
  gem.extra_rdoc_files = %w(README COPYING.txt)

  gem.required_ruby_version	= '>= 1.8.7'
  gem.add_runtime_dependency  'handsoap'
  gem.add_runtime_dependency  'nokogiri'
  gem.add_runtime_dependency  'httpclient'
  gem.add_runtime_dependency  'rubyntlm'
  gem.add_runtime_dependency  'uuid'
end
