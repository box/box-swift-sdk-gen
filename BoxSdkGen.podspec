Pod::Spec.new do |spec|
  spec.name         = 'BoxSdkGen'
  spec.version      = '0.1.0'
  spec.summary      = 'Official Box Swift Generated SDK'
  spec.homepage     = 'https://github.com/box/box-swift-sdk-gen'
  spec.license      = 'Apache-2.0, http://www.apache.org/licenses/LICENSE-2.0'
  spec.author       = { 'Box' => 'sdks@box.com' }
  spec.osx.deployment_target = '10.15'
  spec.ios.deployment_target = '13.0'
  spec.tvos.deployment_target = '13.0'
  spec.watchos.deployment_target = '6.0'
  spec.source       = { :git => 'https://github.com/box/box-swift-sdk-gen.git', :tag => 'v'+spec.version.to_s }
  spec.swift_versions = ['5']
  spec.requires_arc = true
  spec.source_files = 'Sources/**/*.swift'
end
