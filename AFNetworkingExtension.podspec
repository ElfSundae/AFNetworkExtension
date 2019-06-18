Pod::Spec.new do |s|
  s.name        = 'AFNetworkingExtension'
  s.version     = '0.1.0'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.summary     = 'AFNetworking extension'
  s.homepage    = 'https://github.com/ElfSundae/AFNetworkingExtension'
  s.authors     = { 'Elf Sundae' => 'https://0x123.com' }
  s.source      = { :git => 'https://github.com/ElfSundae/AFNetworkingExtension.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'AFNetworkingExtension/AFNetworkingExtension.h'

  s.subspec 'Reachability' do |ss|
    ss.source_files = 'AFNetworkingExtension/Reachability/**/*.{h,m}'
    ss.dependency 'AFNetworking/Reachability', '>= 2.0'
  end
end
