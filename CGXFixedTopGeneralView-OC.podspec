Pod::Spec.new do |s|
s.name         = "CGXFixedTopGeneralView-OC"    #存储库名称
s.version      = "0.5"      #版本号，与tag值一致
s.summary      = "a CGXFixedTopGeneralView-OC 菜单封装"  #简介
s.description  = "CGXFixedTopGeneralView-OC菜单封装封装"  #描述
s.homepage     = "https://github.com/974794055/CGXFixedTopGeneralView-OC"      #项目主页，不是git地址
s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
s.author             = { "974794055" => "974794055@qq.com" }  #作者
s.platform     = :ios, "8.0"                  #支持的平台和版本号
s.source       = { :git => "https://github.com/974794055/CGXFixedTopGeneralView-OC.git", :tag => s.version }         #存储库的git地址，以及tag值
s.requires_arc = true #是否支持ARC
s.frameworks = 'UIKit'


#s.source_files  =  "CGXFixedTopGeneralView-OC", "CGXFixedTopGeneralView-OC/**/*.{h,m}" #需要托管的源代码路径

#需要托管的源代码路径
s.source_files = 'CGXFixedTopGeneralView-OC/CGXFixedTopGeneralView.h'

#开源库头文件
s.public_header_files = 'CGXFixedTopGeneralView-OC/CGXFixedTopGeneralView.h'

 s.subspec 'Common' do |ss|
    ss.source_files = 'CGXFixedTopGeneralView-OC/Common/**/*.{h,m}'

  end

 s.subspec 'TitleView' do |ss|
    ss.source_files = 'CGXFixedTopGeneralView-OC/TitleView/**/*.{h,m}'
  
  end

 s.subspec 'MenuView' do |ss|
    ss.source_files = 'CGXFixedTopGeneralView-OC/MenuView/**/*.{h,m}'
    ss.dependency 'CGXFixedTopGeneralView-OC/Common'
    ss.dependency 'CGXFixedTopGeneralView-OC/TitleView'
  end


end




