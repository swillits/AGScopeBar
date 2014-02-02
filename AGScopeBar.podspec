Pod::Spec.new do |s|
  s.name         = "AGScopeBar"
  s.version      = "0.0.1"
  s.summary      = "Custom scope bar implementation for Cocoa"
  s.homepage     = "https://github.com/swillits/AGScopeBar"
  s.license      = 'Code-level attribution should be maintained, but no credit visible to the end-user is necessary.'
  s.author       = { "Seth Willits" => "seth@freaksw.com"}
  s.source       = { :git => "https://github.com/angerman/AGScopeBar.git", :commit => "a9e8712255b3ef3c273bed47f6dda087059bd338" }
  s.platform     = :osx
  s.source_files = 'AGScopeBar/AGScopeBar.{h,m}'
end
