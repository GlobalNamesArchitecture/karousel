# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'karousel/version'

Gem::Specification.new do |gem|
  gem.name = 'karousel'
  gem.version = Karousel::VERSION
  gem.authors = ['Dmitry Mozzherin', 'David Shorthouse']
  gem.email = 'dmozzherin@gmail.com'
  gem.description = 'Use it if you have way too many items in ' \
                    'your worker gem queue'
  gem.summary = 'Job dispenser for parallel workers'

  gem.homepage = 'http://github.com/GlobalNamesArchitecture/karousel'
  gem.license = 'MIT'

  gem.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.require_paths = ['lib']

  gem.add_development_dependency 'byebug', '~> 9.1'
  gem.add_development_dependency 'coveralls', '~> 0.8'
  gem.add_development_dependency 'rake', '~> 12.0'
  gem.add_development_dependency 'rspec', '~> 3.2'
  gem.add_development_dependency 'rubocop', '~> 0.49'
end
