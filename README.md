# Windless

[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Hero.svg?style=flat)](http://cocoapods.org/pods/Hero)
![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
[![License](https://img.shields.io/cocoapods/l/Hero.svg?style=flat)](https://github.com/lkzhao/Hero/blob/master/LICENSE?raw=true)

**Windless** makes it easy to implement invisible layout loading view.

![Windless](https://github.com/ParkGwangBeom/Windless/blob/master/Resource/sample.gif)


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
    pod 'Windless', '~> 0.1'
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
github "Interactive-Studio/Windless" ~> 0.1
```

Run `carthage update` to build the framework and drag the built `Windless.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Windless into your project manually.

---

## Usage

### Code

```swift
import Windless

class ViewController: UIViewController {

    lazy var contentsView = UIView()
    
    var subView1 = UIView()
    var subView2 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(contentsView)
        contentsView.addSubview(subView1)
        contentsView.addSubview(subView2)
        
        // start
        contentsView.windless
                .setupWindlessableViews([subView1, subView2])
                .start()
                
        // stop
        contentsView.windless.end()
    }

}
```

### Storyboard, Xib

If you use **Storyboard** or **xib**, you only need to set the `isWindlessable` flag to true for the views you want to show as fake in the view inspector of the view, and you do not have to pass the view through the `setupWindlessableViews` method.

![Windless](https://github.com/ParkGwangBeom/Windless/blob/master/Resource/example1.png)

```swift
import Windless

class ViewController: UIViewController {

    @IBOutlet weak var contentsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        contentsView.windless.start()
    }
}
```

### Custom Options

There are several customizable options in **Windless**.

```swift
protocol WindlessType {

    var direction: WindlessDirection { get set }

    var speed: Float { get set }
    
    var beginTime: CFTimeInterval { get set }
    
    var duration: CFTimeInterval { get set }
    
    var pauseDuration: CFTimeInterval { get set }
    
    var timingFuction: CAMediaTimingFunction { get set }
    
    var animationLayerColor: UIColor { get set }
    
    var animationBackgroundColor: UIColor { get set }
    
    var animationLayerOpacity: CGFloat { get set}
    
    var cornerRadius: CGFloat { get set }
}
```

To set the options, use the apply method as shown below.

```swift
import Windless

class ViewController: UIViewController {

    @IBOutlet weak var contentsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        contentsView.windless
            .apply {
                $0.beginTime = 1
                $0.pauseDuration = 2
                $0.duration = 3
                $0.animationLayerOpacity = 0.5
            }
            .start()
    }
}
```

If you want to know more detailed usage, please refer to Example.

## Credits

- GwangBeom Park ([@gwangbeom](https://github.com/ParkGwangBeom))

## License

Windless is released under the MIT license. See LICENSE for details.

