# Reborn

[![CI Status](http://img.shields.io/travis/vbicer/Reborn.svg?style=flat)](https://travis-ci.org/vbicer/Reborn)
[![Version](https://img.shields.io/cocoapods/v/Reborn.svg?style=flat)](http://cocoapods.org/pods/Reborn)
[![License](https://img.shields.io/cocoapods/l/Reborn.svg?style=flat)](http://cocoapods.org/pods/Reborn)
[![Platform](https://img.shields.io/cocoapods/p/Reborn.svg?style=flat)](http://cocoapods.org/pods/Reborn)

## About
**Reborn** checks a user's currently installed version of your iOS app against the version that is currently configured.

If a both versions match and if it's the first time then fire and event to inform configured version installed.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Reborn is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Reborn'
```


## Usage
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupReborn()
    return true
}

func setupReborn(){
    // Alert will be fired when the first time 1.3 version installed
    let reborn = Reborn(at: "1.3")
    reborn.isTest = true
    reborn.delegate = self
    reborn.check()
}

extension AppDelegate: RebornDelegate{
    func rebornDidComplete() {
        print("Reborn did triggered!")
    }
}
```
## Author

vbicer, vlknbcr@gmail.com

## License

Reborn is available under the MIT license. See the LICENSE file for more info.

