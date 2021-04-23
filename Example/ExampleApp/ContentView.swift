//
//  ContentView.swift
//  Example
//
//  Created by Rahul Mayani on 17/04/21.
//

import SwiftUI
import RRRangeSliderSwiftUI

let sliderWidth = Float(UIScreen.main.bounds.width - 50.0)

struct ContentView: View {
    
    @State var minValue: Float = 0.0
    @State var maxValue: Float = sliderWidth
    
    var body: some View {
        
        VStack {
            
            Text("Range Slider")
            
            RRRangeSliderSwiftUI(
                minValue: self.$minValue, // mimimum value
                maxValue: self.$maxValue, // maximum value
                minLabel: "0", // mimimum Label text
                maxLabel: "100", // maximum Label text
                sliderWidth: sliderWidth, // set slider width
                backgroundTrackColor: Color(UIColor.systemTeal).opacity(0.5), // track color
                selectedTrackColor: Color.blue.opacity(25), // track color
                globeColor: Color.orange, // globe background color
                globeBackgroundColor: Color.black, // globe rounded border color
                sliderMinMaxValuesColor: Color.black // all text label color
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

