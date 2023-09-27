Pod::Spec.new do |spec|
  spec.name         = 'BoxSDK'
  spec.version      = '2.0.0'
  spec.summary      = '[Box Platform](https://box.dev) provides functionality to provide access to content stored within [Box](https://box.com). It provides endpoints for basic manipulation of files and folders, management of users within an enterprise, as well as more complex topics such as legal holds and retention policies.'
  spec.homepage     = '<PLEASE FILL OUT THIS FIELD>'
  spec.license      = 'Apache-2.0, http://www.apache.org/licenses/LICENSE-2.0'
  spec.author       = '<PLEASE FILL OUT THIS FIELD>'
  spec.ios.deployment_target = '15.0'
  spec.osx.deployment_target = '12.0'
  spec.source       = { :git => '<PLEASE FILL OUT THIS FIELD>', :tag => 'v'+spec.version.to_s }
  spec.swift_versions = ['5']
  spec.requires_arc = true
  spec.source_files = 'Sources/**/*.swift'
end
