Pod::Spec.new do |s|
  s.name        = 'AFNetworkingExtension'
  s.version     = '1.4.1'
  s.license     = 'MIT'
  s.summary     = 'AFNetworking Extension'
  s.homepage    = 'https://github.com/ElfSundae/AFNetworkingExtension'
  s.social_media_url = 'https://twitter.com/ElfSundae'
  s.authors     = { 'Elf Sundae' => 'https://0x123.com' }
  s.source      = { :git => 'https://github.com/ElfSundae/AFNetworkingExtension.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'

  s.ios.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkingExtension' }
  s.tvos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkingExtension' }
  s.osx.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkingExtension' }
  s.watchos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkingExtension-watchOS' }

  s.source_files = 'AFNetworkingExtension/AFNetworkingExtension.h'

  s.subspec 'Logger' do |ss|
    ss.source_files = 'AFNetworkingExtension/Logger/*.{h,m}'

    ss.dependency 'AFNetworking/NSURLSession', '>= 3.0'
    ss.dependency 'AFNetworkActivityLogger'
    ss.dependency 'ESFramework/Foundation', '~> 3.19'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.source_files = 'AFNetworkingExtension/NSURLSession/*.{h,m}'

    ss.dependency 'AFNetworking/NSURLSession', '>= 3.0'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.tvos.deployment_target = '9.0'
    ss.osx.deployment_target = '10.10'

    ss.source_files = 'AFNetworkingExtension/Reachability/*.{h,m}'

    ss.dependency 'AFNetworking/Reachability', '>= 3.0'
  end

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworkingExtension/Serialization/*.{h,m}'

    ss.dependency 'AFNetworking/Serialization', '>= 3.0'
    ss.dependency 'ESFramework/Foundation', '~> 3.19'
  end
end
