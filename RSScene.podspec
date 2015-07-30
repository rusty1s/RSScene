Pod::Spec.new do |s|

  s.name          = "RSScene"
  s.version       = "1.0"
  s.summary       = "An inheritance of SKScene that adds a game logic loop to the runtime of a scene"

  s.description   = <<-DESC
					RSScene inherits SKScene by adding a game logic loop to the runtime of a scene implemented in Swift. RSScene distinguishs between a rendering loop (fps) and a loop, that calls game update logic. The logic loop typically runs much slower than the rendering loop, because games don't need to update its logic that often. This guarantees great performance for all kind of games!
                    DESC

  s.homepage      = "https://github.com/rusty1s/RSScene"

  s.license       = { :type => "MIT", :file => "LICENSE" }

  s.author        = { "Rusty1s" => "matthias.fey@tu-dortmund.de" }

  s.platform      = :ios, "8.0"

  s.source        = { :git => "https://github.com/rusty1s/RSScene.git" }
  s.source_files  = "RSContactGrid/RSContactGrid/*.swift"

end
