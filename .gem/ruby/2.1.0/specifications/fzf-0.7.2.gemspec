# -*- encoding: utf-8 -*-
# stub: fzf 0.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "fzf"
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Junegunn Choi"]
  s.bindir = "."
  s.date = "2014-02-03"
  s.description = "Fuzzy finder for your shell"
  s.email = ["junegunn.c@gmail.com"]
  s.executables = ["fzf"]
  s.files = ["./fzf"]
  s.homepage = "https://github.com/junegunn/fzf"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Fuzzy finder for your shell"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<curses>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<curses>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<curses>, ["~> 1.0.0"])
  end
end
