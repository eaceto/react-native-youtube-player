Pod::Spec.new do |s|
  s.name         = "react-native-youtube-player"
  s.version      = "0.0.1"
  s.license      = "MIT"
  s.homepage     = "https://github.com/eaceto/react-native-youtube-player"
  s.authors      = { 'Ezequiel Aceto' => 'ezequiel.aceto@gmail.com' }
  s.summary      = "A React Native module that allows you to play YouTube videos from React Native Apps."
  s.source       = { :git => "https://github.com/eaceto/react-native-youtube-player" }
  s.source_files  = "ios/*.{h,m}"
  
  s.platform     = :ios, "9.0"
  s.dependency 'React'
end
