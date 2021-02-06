//
//  ContentView.swift
//  RRRangeSliderSwiftUI
//
//  Created by Rahul Mayani on 06/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var minValue: Float = 0.0
    @State var maxValue: Float = Float(UIScreen.main.bounds.width - 50.0)
    
    var body: some View {
        
        VStack {
            
            Text("Range Slider")
            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
