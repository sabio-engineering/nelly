# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nelly/version'

Gem::Specification.new do |spec|
  spec.name          = 'nelly'
  spec.version       = Nelly::VERSION
  spec.authors       = ['Viktor Fonic', 'Tom Mullen']
  spec.email         = ['viktor@dvelp.co.uk', 'tom@dvelp.co.uk']

  spec.summary       = 'Nelly the elephant cache'
  spec.homepage      = 'http://dvelp.co.uk/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
