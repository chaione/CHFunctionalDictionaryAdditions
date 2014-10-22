Pod::Spec.new do |s|
  s.name     = 'CHFunctionalDictionaryAdditions'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Higher order functions for NSDictionary.'
  s.homepage = 'https://github.com/chaione/CHFunctionalDictionaryAdditions'
  s.authors  = { 'Terry Lewis' => 'terry@ploverproductions.com' }

  s.source   = { :git => 'https://github.com/chaione/CHFunctionalDictionaryAdditions.git', :tag => 'v1.0.0' }
  s.description = 'A few functional additions to NSDictionary such as ch_map: and ch_filter: that make working with NSDictionary much simpler and cleaner.'

  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'CHFunctionalDictionaryAdditions/Source/*.{h,m}'

end
