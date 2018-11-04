# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-diagnostics-sample'
  s.version = '1.0.0.0'
  s.summary = 'Sampling and measurement of execution cycles'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/diagnostics-sample'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'evt-log'
  s.add_runtime_dependency 'evt-configure'
  s.add_runtime_dependency 'evt-schema'

  s.add_development_dependency 'test_bench'
end
