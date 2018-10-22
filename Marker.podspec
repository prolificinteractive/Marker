#
# Be sure to run `pod lib lint Marker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Marker"
  s.version          = "1.2.0"
  s.summary          = "Swift 4.2 migration"
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = "https://github.com/prolificinteractive/Marker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Htin Linn" => "linn@prolificinteractive.com" }
  s.source           = { :git => "https://github.com/prolificinteractive/Marker.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '9.0'

  s.requires_arc = true

  s.source_files = 'Marker/Marker/**/*.{h,swift}'

  s.ios.exclude_files   = 'Marker/Marker/**/NS*Extension.swift'
  s.tvos.exclude_files  = 'Marker/Marker/**/NS*Extension.swift'
  s.osx.exclude_files   = 'Marker/Marker/**/UI*Extension.swift'
end
