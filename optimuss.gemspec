require File.join([File.dirname(__FILE__), 'lib', 'optimuss', 'version.rb'])
Gem::Specification.new do |s|
  s.name = 'optimuss'
  s.version = Optimuss::VERSION
  s.author = 'Bruno Bonamin'
  s.email = 'bruno@bonamin.org'
  s.homepage = 'http://bonamin.org'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A prime number and multiplication table generator'
  s.files = `git ls-files`.split("\n")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'optimuss.rdoc']
  s.rdoc_options << '--title' << 'optimuss'
  s.rdoc_options << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'optimuss'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('rspec')
  s.add_development_dependency('pry')
  s.add_development_dependency('rubocop')

  s.add_runtime_dependency('gli', '2.12.2')
  s.add_runtime_dependency('terminal-table')
end
