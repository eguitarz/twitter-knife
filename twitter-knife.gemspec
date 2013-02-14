gemspec = Gem::Specification.new do |s|
  s.name = 'twitter-knife'
  s.version = '1.0.0'
  s.date = '2013-02-14'
  s.authors = ['Dale Ma']
  s.email = 'dalema22@gmail.com'
  s.summary = 'Simple twitter v1.1 API client'
  s.description = 'Twitter-knife is a really simple twitter v1.1 API client. It only provides get and post methods, user type the API they want in the params.'
  s.homepage = 'https://github.com/eguitarz/twitter-knife'

  s.require_paths = %w(lib)
  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)

  s.add_dependency('oauth', '~> 0.4.7')
end