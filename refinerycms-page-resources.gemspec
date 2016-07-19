Gem::Specification.new do |s|
  s.name              = %q{refinerycms-page-resources}
  s.version           = %q{0.0.2}
  s.description       = %q{Page Resources Engine for Refinery CMS}
  s.summary           = %q{Page Resources Engine for Refinery CMS}
  s.email             = %q{anita@joli.com.au}
  s.homepage          = %q{http://github.com/stasl/refinerycms-page-resources}
  s.authors           = ['Stas Ladonenko, Anita Graham']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  
  s.add_dependency    'refinerycms-pages', ['>= 3.0.0', '< 5.0']
  s.add_dependency    'decorators',        '~> 2.0.0'
  s.add_dependency    'globalize',         '~> 5.0'
end
