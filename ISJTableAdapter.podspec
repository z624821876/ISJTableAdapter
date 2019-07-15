#
# Be sure to run `pod lib lint ISJTableAdapter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ISJTableAdapter'
  s.version          = '0.1.0'
  s.summary          = '一个简单的UITableView适配器'

  s.homepage         = 'https://github.com/z624821876'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'z624821876' => 'yu624821876@163.com' }
  s.source           = { :git => 'https://github.com/z624821876/ISJTableAdapter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ISJTableAdapter/Classes/**/*.{h,m}', 'ISJTableAdapter/Classes/*.{h,m}'
  
  # s.resource_bundles = {
  #   'ISJTableAdapter' => ['ISJTableAdapter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
