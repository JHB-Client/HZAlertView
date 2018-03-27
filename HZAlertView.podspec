Pod::Spec.new do |s|
  s.name         = "HZAlertView"
  s.version      = "0.0.3"
  s.summary      = "华卓组件化alertView"

  s.description  = <<-DESC
                      华卓组件化alertView的代码整理
                   DESC

  s.homepage     = "https://github.com/jihuaibin2017/HZAlertView"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "jihuaibin2015" => "15158863897@163.com" }


  s.platform     = :ios

  s.source       = { :git => "https://github.com/jihuaibin2017/HZAlertView.git", :tag => "0.0.3" }
  s.source_files  = "HZAlertView/**/*.{h,m}"
  s.requires_arc = true
end
