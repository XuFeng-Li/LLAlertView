Pod::Spec.new do |s|

  s.name         = "LLAlertView"
- s.version      = "0.0.1"
+ s.version      = "0.0.1"
  s.summary      = "A short description of LLAlertView."

  s.description  = %{
    LLAlertView 是 自定义的消息弹框。
}

  s.homepage     = "https://github.com/XuFeng-Li/LLAlertView"

  s.license      = "MIT"

  s.author             = "lixufeng"
  s.social_media_url = "http://weibo.com/p/1005053953920795"

  s.platform     = :ios,"5.0"

  #s.source       = { :git => "https://github.com/XuFeng-Li/LLAlertView.git", :commit => "40ba813ee1bc906e09ea7e858707bb0a63517413"}
  s.source       = { :git => "https://github.com/XuFeng-Li/LLAlertView.git", :tag => "v#{s.version}" }
  s.source_files  = 'LLAlartView/*.{h,m}'
#s.source_files  = 'LLAlartView/**/*.{h,m}'
  s.frameworks = 'UIKit','Foundation'

  s.requires_arc = true

end
