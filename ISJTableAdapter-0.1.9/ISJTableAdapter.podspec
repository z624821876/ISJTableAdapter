Pod::Spec.new do |s|
  s.name = "ISJTableAdapter"
  s.version = "0.1.9"
  s.summary = "\u4E00\u4E2A\u7B80\u5355\u7684UITableView\u9002\u914D\u5668"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"z624821876"=>"yu624821876@163.com"}
  s.homepage = "https://github.com/z624821876"
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/ISJTableAdapter.embeddedframework/ISJTableAdapter.framework'
end
