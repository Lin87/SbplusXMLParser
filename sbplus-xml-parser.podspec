Pod::Spec.new do |s|
  s.name             = "sbplus-xml-parser"
  s.version          = "1.0.44"
  s.summary          = "The open source Storybook+ XML parser."
  s.homepage         = "https://github.com/oel-mediateam/sbplus-xml-parser"
  s.license          = 'GNU General Public License v3.0'
  s.author           = { "Ethan Lin" => "ethan.lin@uwex.edu" }
  s.source           = { :git => "https://github.com/oel-mediateam/sbplus-xml-parser.git", :tag => s.version }

  s.platform     = :osx, '10.12'
  s.requires_arc = true

  s.source_files = 'SbPlusXmlManager/CommonSource'
  s.swift_version = '5'

end
