Pod::Spec.new do |s| 
  s.name = 'NIMKit' 
  s.version = '3.1.3' 
  s.summary = 'Netease IM UI Kit' 
  s.homepage = 'http://netease.im' 
  s.license = { :'type' => 'Copyright', :'text' => ' Copyright 2019 Netease '} 
  s.authors = 'Netease IM Team'  
  s.source  = { :git => 'https://github.com/netease-im/NIM_iOS_UIKit.git', :tag => '3.1.3'}  
  s.platform = :ios, '9.0' 
  s.frameworks = 'CoreText', 'SystemConfiguration', 'AVFoundation', 'CoreTelephony', 'AudioToolbox', 'CoreMedia' , 'VideoToolbox' 
  s.libraries  = 'sqlite3.0', 'z', 'c++' 


  s.subspec 'Full' do |cs|
    cs.source_files  = 'NIMKit/NIMKit/Classes/**/*.{h,m}'
    cs.dependency 'NIMKit/Core'
    cs.dependency 'NIMSDK', '~> 8.1.2'
  end

  s.subspec 'Lite' do |cs|
    cs.source_files  = 'NIMKit/NIMKit/Classes/**/*.{h,m}'
    cs.dependency 'NIMKit/Core'
    cs.dependency 'NIMSDK_LITE', '~> 8.1.2'
  end
  
  s.subspec 'Core' do |os|     
    os.resources = 'NIMKit/Resources/*.*'   
    os.dependency 'SDWebImage', '~> 5.0.6'       
    os.dependency 'TZImagePickerController', '~> 3.2.1'  
    os.dependency 'M80AttributedLabel', '~> 1.9.9' 
    os.dependency 'YYImage', '~> 1.0.4'
	os.dependency 'YYImage/WebP', '~> 1.0.4'       
	      
  end


  s.subspec 'Full_Free' do |cs|
    cs.source_files  = 'NIMKit/NIMKit/Classes/**/*.{h,m}'
    cs.dependency 'NIMKit/Core_Free'
    cs.dependency 'NIMSDK', '~> 8.1.2'
  end

  s.subspec 'Lite_Free' do |cs|
    cs.source_files  = 'NIMKit/NIMKit/Classes/**/*.{h,m}'
    cs.dependency 'NIMKit/Core_Free'
    cs.dependency 'NIMSDK_LITE', '~> 8.1.2'
  end

  s.subspec 'Core_Free' do |os|
    os.resources = 'NIMKit/Resources/*.*'
    os.dependency 'SDWebImage'
    os.dependency 'M80AttributedLabel'
    os.dependency 'TZImagePickerController'
    os.dependency 'YYImage'
	os.dependency 'YYImage/WebP'
  end

  

  s.default_subspec = 'Lite'  

end 
