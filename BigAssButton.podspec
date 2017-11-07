Pod::Spec.new do |s|
  s.name         = "BigAssButton"
  s.version      = "0.1.6"
  s.summary      = "A button with rounded corners and horizontally aligned title and image."
  s.description  = "A reusable, customizable UIButton that horizontally aligns the button's image and title. Works with Storyboards & Interface Builder."
  s.homepage     = "https://github.com/ashtonmeuser/BigAssButton"
  s.license      = "MIT"
  s.author       = "Ashton Meuser"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ashtonmeuser/BigAssButton.git", :tag => "#{s.version}" }
  s.source_files  = "BigAssButton", "BigAssButton/**/*.{h,m}"
end
