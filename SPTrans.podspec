#
# Be sure to run `pod lib lint SPTrans.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SPTrans'
  s.version          = '0.1.0'
  s.summary          = 'Acesso a API da SPTrans (Sao Paulo Transporte).'
  s.description      = '<<-DESC'
  s.homepage         = 'https://github.com/ezefranca/SPTrans'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezefranca' => 'ezequiel.ifsp@gmail.com' }
  s.source           = { :git => 'https://github.com/ezefranca/SPTrans.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ezefranca'
  s.ios.deployment_target = '8.0'
  s.source_files = 'SPTrans/Classes/**/*'
  s.dependency 'Alamofire', '~> 3.4'
end
