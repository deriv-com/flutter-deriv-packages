#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint deriv_rudderstack.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'deriv_rudderstack'
  s.version          = '0.0.2'
  s.summary          = 'A new Flutter plugin to wrap RudderStack SDK.'
  s.description      = <<-DESC
A new Flutter plugin to wrap RudderStack SDK.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Rudder', '~> 1.1.0'
  s.platform = :ios, '12.0'
  s.preserve_paths = 'Rudder.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework Rudder' }
  s.vendored_frameworks = 'Rudder.framework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

end
