Pod::Spec.new do |s|
  s.name         = "Windless"
  s.version      = "0.1.2"
  s.summary      = "loading view"
  s.description  = "Windless makes it easy to implement invisible layout loading view."
  s.homepage     = "https://github.com/Interactive-Studio/Windless"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gwangbeom" => "battlerhkqo@naver.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/Interactive-Studio/Windless.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
end
