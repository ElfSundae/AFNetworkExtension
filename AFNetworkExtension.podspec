Pod::Spec.new do |s|
  s.name        = 'AFNetworkExtension'
  s.version     = '2.0.0'
  s.license     = 'MIT'
  s.summary     = 'AFNetworking 3/4 Extensions'
  s.homepage    = 'https://github.com/ElfSundae/AFNetworkExtension'
  s.social_media_url = 'https://twitter.com/ElfSundae'
  s.authors     = { 'Elf Sundae' => 'https://0x123.com' }
  s.source      = { :git => 'https://github.com/ElfSundae/AFNetworkExtension.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'

  s.ios.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkExtension' }
  s.tvos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkExtension' }
  s.osx.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkExtension' }
  s.watchos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.0x123.AFNetworkExtension-watchOS' }

  s.source_files = 'AFNetworkExtension/AFNetworkExtension.h'

  s.subspec 'Logger' do |ss|
    ss.source_files = 'AFNetworkExtension/Logger/*.{h,m}'

    ss.dependency 'AFNetworking/NSURLSession', '>= 3.0'
    ss.dependency 'AFNetworkActivityLogger', '>= 3.0'
    ss.dependency 'ESFramework', '~> 3.22'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.source_files = 'AFNetworkExtension/NSURLSession/*.{h,m}'

    ss.dependency 'AFNetworking/NSURLSession', '>= 3.0'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.tvos.deployment_target = '9.0'
    ss.osx.deployment_target = '10.10'

    ss.source_files = 'AFNetworkExtension/Reachability/*.{h,m}'

    ss.dependency 'AFNetworking/Reachability', '>= 3.0'
  end

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworkExtension/Serialization/*.{h,m}'

    ss.dependency 'AFNetworking/Serialization', '>= 3.0'
    ss.dependency 'ESFramework', '~> 3.22'
  end
end
