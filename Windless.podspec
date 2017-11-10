Pod::Spec.new do |s|
  s.name         = "Windless"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = "https://github.com/ParkGwangBeom/Windless.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gwangbeom" => "battlerhkqo@naver.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/ParkGwangBeom/Windless.git.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
