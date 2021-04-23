import SwiftUI

public struct RRRangeSliderSwiftUI: View {
    /// ` Slider` Binding min & max values
    @Binding var minValue: Float
    @Binding var maxValue: Float
            
    /// Set slider min & max Label values
    let minLabel: String
    let maxLabel: String
    
    /// Set slider width
    let sliderWidth: Float
    
    /// `Slider` background track color
    let backgroundTrackColor: Color
    /// `Slider` selected track color
    let selectedTrackColor: Color
    
    /// Globe background color
    let globeColor: Color
    /// Globe rounded boarder color
    let globeBackgroundColor: Color
    
    /// Slider min & max static and dynamic labels value color
    let sliderMinMaxValuesColor: Color
    
    /// `Slider` init
    public init(minValue: Binding<Float>,
               maxValue: Binding<Float>,
               minLabel: String = "0",
               maxLabel: String = "100",
               sliderWidth: Float = 0,
               backgroundTrackColor: Color = Color(UIColor.systemTeal).opacity(0.3),
               selectedTrackColor: Color = Color.blue.opacity(25),
               globeColor: Color = Color.orange,
               globeBackgroundColor: Color = Color.black,
               sliderMinMaxValuesColor: Color = Color.black) {
        self._minValue = minValue
        self._maxValue = maxValue
        self.minLabel = minLabel
        self.maxLabel = maxLabel
        self.sliderWidth = sliderWidth
        self.backgroundTrackColor = backgroundTrackColor
        self.selectedTrackColor = selectedTrackColor
        self.globeColor = globeColor
        self.globeBackgroundColor = globeBackgroundColor
        self.sliderMinMaxValuesColor = sliderMinMaxValuesColor
    }
    
    /// `Slider` view setup
    public var body: some View {
        
        VStack {
                
            /// `Slider` start & end static values show in view
            HStack {
                // start value
                Text(minLabel)
                    .offset(x: 28, y: 20)
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(sliderMinMaxValuesColor)
                
                Spacer()
                // end value
                Text(maxLabel)
                    .offset(x: -18, y: 20)
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .foregroundColor(sliderMinMaxValuesColor)
            }
            
            /// `Slider` track view with glob view
            ZStack (alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                // background track view
                Capsule()
                    .fill(backgroundTrackColor)
                    .frame(width: CGFloat(self.sliderWidth + 10), height: 30)
                
                // selected track view
                Capsule()
                    .fill(selectedTrackColor)
                    .offset(x: CGFloat(self.minValue))
                    .frame(width: CGFloat((self.maxValue) - self.minValue), height: 30)
                
                // minimum value glob view
                Circle()
                    .fill(globeColor)
                    .frame(width: 30, height: 30)
                    .background(Circle().stroke(globeBackgroundColor, lineWidth: 2))
                    .offset(x: CGFloat(self.minValue))
                    .gesture(DragGesture().onChanged({ (value) in
                        /// drag validation
                        if value.location.x > 8 && value.location.x <= self.sliderWidth &&
                            value.location.x < CGFloat(self.maxValue - 30) {
                            // set min value of slider
                            self.minValue = Float(value.location.x - 8)
                        }
                    }))
                
                // minimum value text draw inside minimum glob view
                Text(String(format: "%.0f", (CGFloat(self.minValue) / self.sliderWidth) * 100))
                    .offset(x: CGFloat(self.minValue))
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(sliderMinMaxValuesColor)
                      
                // maximum value glob view
                Circle()
                    .fill(globeColor)
                    .frame(width: 30, height: 30)
                    .background(Circle().stroke(globeBackgroundColor, lineWidth: 2))
                    .offset(x: CGFloat(self.maxValue - 18))
                    .gesture(DragGesture().onChanged({ (value) in
                        /// drag validation
                        if value.location.x - 8 <= self.sliderWidth && value.location.x > CGFloat(self.minValue + 50) {
                            // set max value of slider
                            self.maxValue = Float(value.location.x - 8)
                        }
                    }))
                
                // maximum value text draw inside maximum glob view
                Text(String(format: "%.0f", (CGFloat(self.maxValue) / self.sliderWidth) * 100))
                    .offset(x: CGFloat(self.maxValue - 18))
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(sliderMinMaxValuesColor)
            })
            .padding()
        }
    }
}

