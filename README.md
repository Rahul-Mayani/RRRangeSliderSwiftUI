# RRRangeSliderSwiftUI

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/Rahul-Mayani/RRRangeSliderSwiftUI/blob/master/LICENSE)
[![iOS](https://img.shields.io/badge/Platform-iOS-orange.svg?style=flat)](https://developer.apple.com/ios/)
[![Swift 5+](https://img.shields.io/badge/Swift-5+-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![RangeSlider](https://img.shields.io/badge/Range-Slider-orange.svg?style=flat)](https://github.com/Rahul-Mayani/RRRangeSliderSwiftUI/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-orange.svg?style=flat)](https://developer.apple.com/swiftui/)

Custom range slider in SwiftUI

## Installation

#### Manually
1. Download the project.
2. Add `RRRangeSlider.swift` file for slider view
3. Add necessary files in your project.
4. Congratulations!  

## Usage example
To run the example project, clone the repo, and run pod install from the Example directory first.

![alt text](https://github.com/Rahul-Mayani/RRRangeSliderSwiftUI/blob/main/sample.mov)

```
@State var minValue: Float = 0.0
@State var maxValue: Float = Float(UIScreen.main.bounds.width - 50.0)

var body: some View {
    
    VStack {
        
        Text("Range Slider")
        /// slider view
        RRRangeSlider(
            minValue: self.$minValue, // mimimum value
            maxValue: self.$maxValue, // maximum value
            sliderWidth: CGFloat(maxValue), // set slider width
            backgroundTrackColor: Color(UIColor.systemTeal).opacity(0.5), // track color
            selectedTrackColor: Color.blue.opacity(25), // track color
            globeColor: Color.orange, // globe background color
            globeBackgroundColor: Color.black, // globe rounded border color
            globeMinMaxValuesColor: Color.black // all text label color
        )
    }
}


```

## Contribute 

We would love you for the contribution to **RRRangeSliderSwiftUI**, check the ``LICENSE`` file for more info.


## License

RRRangeSliderSwiftUI is available under the MIT license. See the LICENSE file for more info.
