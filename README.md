- Windless 이미지

[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Hero.svg?style=flat)](http://cocoapods.org/pods/Hero)
![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
[![License](https://img.shields.io/cocoapods/l/Hero.svg?style=flat)](https://github.com/lkzhao/Hero/blob/master/LICENSE?raw=true)

- 소개
- gif이미지

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build Windless 4.0+.

To integrate Windless into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Windless', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Windless into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Interactive-Studio/Windless" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `Windless.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.

---

## Usage

### Usage Example 1

```swift
import Windless

class ViewController: UIViewController {

    lazy var contentsView = UIView()
    
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var view4 = UIView()
    var view5 = UIView()
    var view6 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(contentsView)
        
        // start
        contentsView.windless
               .setupContainer([view1, view2, view3, view4, view5, view6])
               .apply {
                    $0?.beginTime = 1
                    $0?.duration = 3
                    $0?.animationLayerColor = .red
                }
                .start()
                
        // stop
        contentsView.windless.end()
    }

}
```

### Usage Example 2

```swift
import Windless

class ViewController: UIViewController {

    lazy var contentsView = UIView()
    
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var view4 = UIView()
    var view5 = UIView()
    var view6 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(contentsView)
        
        contentsView.windless
               .setupContainer([view1, view2, view3, view4, view5, view6])
               .apply {
                    $0?.beginTime = 1
                    $0?.duration = 3
                    $0?.animationLayerColor = .red
                }
                .start()
    }

}
```

## Credits

- GwangBeom Park ([@gwangbeom](https://github.com/ParkGwangBeom))

## License

Windless is released under the MIT license. See LICENSE for details.

