Pod::Spec.new do |s|
  s.name        = 'AFNetworkingExtension'
  s.version     = '1.3.0'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.summary     = 'AFNetworking Extension'
  s.homepage    = 'https://github.com/ElfSundae/AFNetworkingExtension'
  s.social_media_url = 'https://twitter.com/ElfSundae'
  s.authors     = { 'Elf Sundae' => 'https://0x123.com' }
  s.source      = { :git => 'https://github.com/ElfSundae/AFNetworkingExtension.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'AFNetworkingExtension/AFNetworkingExtension.h'

  s.subspec 'Logger' do |ss|
    ss.source_files = 'AFNetworkingExtension/Logger/**/*.{h,m}'
    ss.dependency 'AFNetworking/NSURLSession', '~> 3.0'
    ss.dependency 'AFNetworkActivityLogger', '~> 3.0'
    ss.dependency 'ESFramework/Core', '~> 3.18'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.source_files = 'AFNetworkingExtension/NSURLSession/**/*.{h,m}'
    ss.dependency 'AFNetworking/NSURLSession', '~> 3.0'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.11'
    ss.tvos.deployment_target = '9.0'

    ss.source_files = 'AFNetworkingExtension/Reachability/**/*.{h,m}'
    ss.dependency 'AFNetworking/Reachability', '>= 2.0'
  end

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworkingExtension/Serialization/**/*.{h,m}'
    ss.dependency 'AFNetworking/Serialization', '~> 3.0'
    ss.dependency 'ESFramework/Foundation', '~> 3.18'
  end
end
