ipa build -w App.xcworkspace -s Scheme -m "XYZ.mobileprovision" -i "YYY" --xcargs 'CODE_SIGN_ENTITLEMENTS="Entitlements.plist" CODE_SIGN_IDENTITY="iPhone Distribution: XXX (YYY)"'

-w App.xcworkspace
-s Scheme
-m "XYZ.mobileprovision"
-i "YYY"
--xcargs 'CODE_SIGN_ENTITLEMENTS="Entitlements.plist" CODE_SIGN_IDENTITY="iPhone Distribution: XXX (YYY)"'
-c Release  or Debug