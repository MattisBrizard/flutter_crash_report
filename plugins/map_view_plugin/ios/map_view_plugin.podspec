#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'map_view_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
#  s.static_framework = true
  s.ios.deployment_target = '8.0'
  s.preserve_paths = 'Frameworks/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework VisioMoveEssential' }
  s.vendored_frameworks = 'Frameworks/VisioMoveEssential.framework'
  # s.resources = ['Bundle/*.bundle']
  s.resource_bundles = {
    'VisioMoveEssential' => ['Bundle/VisioMoveEssential.bundle'],
    'VisioMoveEssentialStrings' => ['Bundle/VisioMoveEssentialStrings.bundle']
  }
  
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
