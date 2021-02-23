#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint deriv_survicate.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'deriv_survicate'
  s.version          = '0.0.1'
  s.summary          = 'A plugin for run survicate surveys on iOS and Android platforms.'
  s.description      = <<-DESC
A plugin for run survicate surveys on iOS and Android platforms.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Survicate', '1.4.3'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
