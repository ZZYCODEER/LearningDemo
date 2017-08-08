post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Dev'
                config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
                config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
            end
        end
    end
end

 source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

platform :ios,'8.0'
target 'LearningDemo' do

pod 'AFNetworking'
pod 'ReactiveObjC'


end
