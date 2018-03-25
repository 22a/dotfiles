# Download the macOS high sierra installer app from the mac app store

hdiutil create -o /tmp/10.13.x.cdr -size 5530m -layout SPUD -fs HFS+J
hdiutil attach /tmp/10.13.x.cdr.dmg -noverify -mountpoint /Volumes/1013_install
sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/1013_install
mv /tmp/10.13.x.cdr.dmg /Users/Shared/10.13.x.dmg
hdiutil detach /Volumes/Install\ macOS\ High\ Sierra
hdiutil convert /Users/Shared/10.13.x.dmg -format UDTO -o /Users/Shared/10.13.x
rm /Users/Shared/10.13.x.dmg
mv /Users/Shared/10.13.x.cdr /Users/Shared/10.13.x.iso
