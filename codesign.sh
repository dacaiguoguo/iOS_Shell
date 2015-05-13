codesign --display -r- Payload/test.app 
Executable=/Users/me/Desktop/test/Payload/test.app/test
designated => anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.3] /* exists */ and identifier "com.test.test"


codesign -vv -d test.app
Executable=/Users/me/Desktop/test/Payload/test.app/test
Identifier=com.testapp.testapp
Format=bundle with Mach-O universal (armv7 armv7s)
CodeDirectory v=20200 size=36541 flags=0x0(none) hashes=1818+5 location=embedded
Signature size=3487
Authority=Apple iPhone OS Application Signing
Authority=Apple iPhone Certification Authority
Authority=Apple Root CA
Info.plist entries=35
TeamIdentifier=KB7B8S2E4U
Sealed Resources version=2 rules=5 files=1240
Internal requirements count=1 size=100