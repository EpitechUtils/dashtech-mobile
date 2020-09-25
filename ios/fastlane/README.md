fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios beta_deploy
```
fastlane ios beta_deploy
```
Build .ipa and push a new beta build to TestFlight
### ios call_upload_to_testflight
```
fastlane ios call_upload_to_testflight
```
Just push a new beta build to TestFlight
### ios upload_dsyms
```
fastlane ios upload_dsyms
```
Refresh DSYMs files from iTunes Connect and upload symbols to Crashlytics

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
