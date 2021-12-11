//
//  ContentView.swift
//  WeatherBalloon
//
//  Created by Jacobo de Juan Millon on 2021-12-11.
//

import SwiftUI

struct ContentView: View {
    @State var h = 10.0
    @State var M = 20.0
    var inth: Int {
        return Int(h)
    }
    var intM: Int {
        return Int(M)
    }
    @State var feedback = ""
    var touchesGround: Int {
        for i in 1...intM {
            if(-6 * i * i * i * i + inth * i * i * i + 2 * i * i + i <= 0) {
                return i
            }
        }
        return 0
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("The altitude A (in meters above the ground) at hour t after launching is:")
                Text("A = -6t4 + ht3 + 2t2 + t")
                Text("Value of h:")
                HStack {
                    Spacer()
                    Text("\(inth)")
                    Spacer()
                }
                Slider(value: $h,
                       in: 0...100,
                       step: 1.0,
                       label: {
                    Text("Value of h")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                Text("Value of M:")
                HStack {
                    Spacer()
                    Text("\(intM)")
                    Spacer()
                }
                Slider(value: $M,
                       in: 1...239,
                       step: 1.0,
                       label: {
                    Text("Value of M")
                },
                       minimumValueLabel: {
                    Text("1")
                },
                       maximumValueLabel: {
                    Text("239")
                })
                Text(touchesGround == 0 ? "The balloon does not touch ground in the given time." : """
                    The balloon first touches ground at hour:
                    \(touchesGround)
                    """)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
