# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'fzf'
  spec.version       = '0.7.2'
  spec.authors       = ['Junegunn Choi']
  spec.email         = ['junegunn.c@gmail.com']
  spec.description   = %q{Fuzzy finder for your shell}
  spec.summary       = %q{Fuzzy finder for your shell}
  spec.homepage      = 'https://github.com/junegunn/fzf'
  spec.license       = 'MIT'

  spec.bindir        = '.'
  spec.files         = %w[fzf.gemspec]
  spec.executables   = 'fzf'

  spec.add_runtime_dependency 'curses', '~> 1.0.0'
end
