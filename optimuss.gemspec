require File.join([File.dirname(__FILE__), 'lib', 'optimuss', 'version.rb'])
Gem::Specification.new do |s|
  s.name = 'optimuss'
  s.version = Optimuss::VERSION
  s.author = 'Bruno Bonamin'
  s.email = 'bruno@bonamin.org'
  s.homepage = 'http://bonamin.org'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A prime number and multiplication table generator.'
  s.description = 'Optimuss will allow you to generate a multiplication table \
    with prime numbers and get a prime number at a certain position.'
  s.licenses = ['MIT']
  s.files = `git ls-files`.split("\n")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'optimuss.rdoc']
  s.rdoc_options << '--title' << 'optimuss'
  s.rdoc_options << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'optimuss'
  s.add_development_dependency('rake', '~> 10.4')
  s.add_development_dependency('rdoc', '~> 4.2')
  s.add_development_dependency('rspec', '~> 3.1')
  s.add_development_dependency('pry', '~> 0.10')
  s.add_development_dependency('rubocop', '~> 0.28')

  s.add_runtime_dependency('gli', '2.12.2')
  s.add_runtime_dependency('terminal-table', '~> 1.4')
end
