# ZGradientView

<p><img src="https://i.imgur.com/ab433Va.png" width="300px"/></p>

## Usage

# Programmatically

    import ZGradientView

    @IBOutlet weak var gradientView4: ZGradientView!
    @IBOutlet weak var gradientView3: ZGradientView!
    @IBOutlet weak var gradientView2: ZGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView2.colors = [UIColor(hex: "#800080ff")!.cgColor, UIColor(hex: "#ffc0cbff")!.cgColor]
        gradientView3.colors = [UIColor(hex: "#00F260ff")!.cgColor, UIColor(hex: "#0575E6ff")!.cgColor]
        gradientView4.colors = [UIColor(hex: "#8A2387ff")!.cgColor, UIColor(hex: "#E94057ff")!.cgColor, UIColor(hex: "#F27121ff")!.cgColor]
        
        gradientView4.locations = [0.15, 0.7, 1.0]
        gradientView2.diagonalMode = true
        gradientView4.horizontalMode = true
    }

# Using UIView

<p><img src="https://i.imgur.com/VztEMPc.png" width="300px"/></p>
<p>Note: For two colors make center color default or clear </p>

## Requirements

## Installation

ZGradientView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZGradientView'
```

## Author

sudayn, sudosuwal@gmail.com

## License

ZGradientView is available under the MIT license. See the LICENSE file for more info.
