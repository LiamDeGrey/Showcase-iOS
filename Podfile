platform :ios, '9.0'
use_frameworks!

$rx_library_version = '4.1.2'

$pod_prefix = '>=' #TODO: Remove this prefix before release

def shared_pods
  pod 'RxSwift', $pod_prefix + $rx_library_version
  pod 'RxCocoa', $pod_prefix + $rx_library_version 
end

target 'Showcase' do
  shared_pods
end

target 'Showcase-Dev' do
  shared_pods
end
