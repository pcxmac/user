# -*- encoding: utf-8 -*-
# stub: curses 1.0.1 ruby lib
# stub: ext/curses/extconf.rb

Gem::Specification.new do |s|
  s.name = "curses"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Hodel", "Shugo Maeda"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDNjCCAh6gAwIBAgIBAjANBgkqhkiG9w0BAQUFADBBMRAwDgYDVQQDDAdkcmJy\nYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZFgNu\nZXQwHhcNMTQwMzI0MjEwNTQ1WhcNMTUwMzI0MjEwNTQ1WjBBMRAwDgYDVQQDDAdk\ncmJyYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZ\nFgNuZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbbgLrGLGIDE76\nLV/cvxdEzCuYuS3oG9PrSZnuDweySUfdp/so0cDq+j8bqy6OzZSw07gdjwFMSd6J\nU5ddZCVywn5nnAQ+Ui7jMW54CYt5/H6f2US6U0hQOjJR6cpfiymgxGdfyTiVcvTm\nGj/okWrQl0NjYOYBpDi+9PPmaH2RmLJu0dB/NylsDnW5j6yN1BEI8MfJRR+HRKZY\nmUtgzBwF1V4KIZQ8EuL6I/nHVu07i6IkrpAgxpXUfdJQJi0oZAqXurAV3yTxkFwd\ng62YrrW26mDe+pZBzR6bpLE+PmXCzz7UxUq3AE0gPHbiMXie3EFE0oxnsU3lIduh\nsCANiQ8BAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQW\nBBS5k4Z75VSpdM0AclG2UvzFA/VW5DANBgkqhkiG9w0BAQUFAAOCAQEACQFPYbmk\nP51YZtd2sTMJkwhMs3RtLy+MqFpITMoPUjK1gvPw6NyzotvW0WkiU3KXIOem4l8s\nlDqWPIGobRf+Hvzp92hX/CEDGOSMbVBzuLZ4NAQftpvF91FE8KYCvrO+Nj8ei2X/\n+R7biySvcvWhCsIuBawVW6RxZdxaEHVZrbTX9cqGTAfnWhOIpsGJ/vNOofu1jIrw\ndAwolOAbVCvXy7lPI7oFtVzGu18RT7NW6Q4frd28V0Qs4shmW+ckdlneSzN1hVft\npfkQPF5Ezsi73pEpFN93Fy21NKCYQH1jCwWeKUF29MIMGd6kE3ZmHW/7fz5GwKIM\nLs5SgY48a0l7Hw==\n-----END CERTIFICATE-----\n"]
  s.date = "2014-03-26"
  s.description = "A Ruby binding for curses, ncurses, and PDCurses, formerly part of the Ruby\nstandard library.   curses is an extension library for text UI applications."
  s.email = ["drbrain@segment7.net", ""]
  s.extensions = ["ext/curses/extconf.rb"]
  s.extra_rdoc_files = ["History.md", "Manifest.txt", "README.md", "ext/curses/curses.c"]
  s.files = ["History.md", "Manifest.txt", "README.md", "ext/curses/curses.c", "ext/curses/extconf.rb"]
  s.homepage = "https://github.com/ruby/curses"
  s.licenses = ["Ruby", "BSD-2-Clause"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubyforge_project = "curses"
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby binding for curses, ncurses, and PDCurses, formerly part of the Ruby standard library"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.8"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.2"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.8"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.2"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.8"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
