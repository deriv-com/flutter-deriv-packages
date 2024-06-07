#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint deriv_passkeys.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'deriv_passkeys'
  s.version          = '1.0.0'
  s.summary          = 'Deriv Passkeys for iOS.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://deriv.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Deriv' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
