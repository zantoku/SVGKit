Pod::Spec.new do |s|
  s.name        = 'TikSVGKit'
  s.version     = '2.0'
  s.license     = 'MIT'
  s.platform    = :ios, '5.0'
  s.summary     = "Fork of SVGKit 2.x branch, some specific fixes"
  s.homepage = 'https://github.com/SVGKit/SVGKit'
  s.source   = { :git => 'https://github.com/zantoku/SVGKit.git', :branch => "2.x" }

  s.ios.source_files = 'Source/*{.h,m}', 'Source/DOM classes/**/*.{h,m}', 'Source/Exporters/*.{h,m}', 'Source/Parsers/**/*.{h,m}', 'Source/QuartzCore additions/**/*.{h,m}', 'Source/Sources/**/*.{h,m}', 'Source/UIKit additions/**/*.{h,m}', 'Source/Unsorted/**/*.{h,m}'
  s.libraries = 'xml2'
  s.framework = 'QuartzCore', 'CoreText'
  s.dependency 'CocoaLumberjack', '~> 2.x'
  s.prefix_header_file = 'XCodeProjectData/SVGKit-iOS/SVGKit-iOS-Prefix.pch'
  s.requires_arc = false
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'
  }
  
  s.subspec 'DOMSpecCompliance' do |ss|
    ss.source_files = 'Source/DOM spec compliance/DOMCompatibilityAliases.h'
  end
  
end
