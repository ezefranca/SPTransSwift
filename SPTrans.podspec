Pod::Spec.new do |s|
  s.name = 'SPTrans'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Acesso a API da SPTrans (Sao Paulo Transporte).'
  s.homepage = 'https://github.com/ezefranca/SPTrans'
  s.social_media_url = 'http://twitter.com/ezefranca'
  s.authors = { 'Ezequiel França' => 'ezequiel.ifsp@gmail.com' }
  s.source = { :git => 'https://github.com/ezefranca/SPTrans.git', :tag => s.version }
  s.dependency 'Alamofire', '~> 3.4'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'SPTrans/*'
end
