lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'

if RUBY_VERSION < '2.0.0'
  require 'sensu-plugins-windows-ad'
else
  require_relative 'lib/sensu-plugins-windows-ad'
end
#require File.expand_path(File.dirname(__FILE__)) + '/lib/sensu-plugin-ad'

Gem::Specification.new do |s|
  s.name                 = 'sensu-plugins-windows-ad'
  s.date                 = Date.today.to_s
  s.version              = SensuPluginsWindowsAd::Version::VER_STRING
  s.platform             = Gem::Platform::RUBY
  s.authors              = ['Cameron Soleimani']
  s.email                = ['csoleiw@ext.uber.com']
  s.homepage             = 'https://stash.corp.uber.internal/projects/ITP/repos/sensu-plugins-windows-ad/'
  s.summary              = 'Sensu Plugin for doing checks on Active Directory'
  s.description          = 'This Plugin provides checks and metrics for monitoring Active Directory'
  s.license              = 'MIT'
  s.has_rdoc             = false
  s.require_paths        = ['lib']
  s.executables          = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                = Dir.glob('{bin,lib}/**/*')
  s.post_install_message = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'

  s.add_runtime_dependency     'sensu-plugin', '~> 1.2'
  s.add_development_dependency 'rake', '~> 10.0'
end
