//
//  RRRangeSlider.swift
//  RRRangeSliderSwiftUI
//
//  Created by Rahul Mayani on 06/02/21.
//

import SwiftUI

struct RRRangeSlider: View {
    /// ` Slider` Binding min & max values
    @Binding var minValue: Float
    @Binding var maxValue: Float
            
    /// Set slider width
    @State var sliderWidth: CGFloat = 0.0
    
    /// `Slider` background track color
    @State var backgroundTrackColor = Color(UIColor.systemTeal).opacity(0.3)
    /// `Slider` selected track color
    @State var selectedTrackColor = Color.blue.opacity(25)
    
    /// Globe background color
    @State var globeColor = Color.orange
    /// Globe rounded boarder color
    @State var globeBackgroundColor = Color.black
    
    /// Globe min & max static and dynamic labels value color
    @State var globeMinMaxValuesColor = Color.black
    
    /// `Slider` view setup
    var body: some View {
        VStack {
                
            /// `Slider` start & end static values show in view
            HStack {
                // start value
                Text("0")
                    .offset(x: 28, y: 20)
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(globeMinMaxValuesColor)
                
                Spacer()
                // end value
                Text("100")
                    .offset(x: -18, y: 20)
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .foregroundColor(globeMinMaxValuesColor)
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
                    .foregroundColor(globeMinMaxValuesColor)
                      
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
                    .foregroundColor(globeMinMaxValuesColor)
            })
            .padding()
        }
    }
}
