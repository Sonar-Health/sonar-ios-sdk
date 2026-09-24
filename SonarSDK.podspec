Pod::Spec.new do |s|
  s.name                = 'SonarSDK'
  s.version             = '0.1.2'
  s.summary             = 'Syncs Apple Health data to Sonar.'
  s.homepage            = 'https://docs.sonarhealth.co/ios-sdk/'
  s.license             = { type: 'Proprietary', file: 'LICENSE' }
  s.author              = 'Sonar Health'
  s.source              = { http: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/#{s.version}/SonarSDK.xcframework.zip" }
  s.platforms           = { ios: '16.0' }
  s.swift_version       = '5.9'
  s.vendored_frameworks = 'SonarSDK.xcframework'
  s.frameworks          = 'HealthKit', 'BackgroundTasks'
end
