Pod::Spec.new do |s|
  s.name        = 'AFNetworkingExtension'
  s.version     = '0.1.0'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.summary     = 'AFNetworking extensions'
  s.homepage    = 'https://github.com/ElfSundae/AFNetworkingExtension'
  s.authors     = { 'Elf Sundae' => 'https://0x123.com' }
  s.source      = { :git => 'https://github.com/ElfSundae/AFNetworkingExtension.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.source_files = 'AFNetworkingExtension/**/*.{h,m}'
  # s.dependency 'AFNetworking/Reachability', '>= 2.0'

  # s.subspec 'Core' do |ss|
  #   ss.source_files = 'AFNetworkingExtension/Core/**/*.{h,m}'
  # end
end
