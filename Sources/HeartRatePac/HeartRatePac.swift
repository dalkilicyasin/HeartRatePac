//
//  HeartRating.swift
//  HeartRating
//
//  Created by Yasin Dalkilic on 2.02.2023.
//

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct HeartRatePac: View {
    var maxRating : Int 
    @Binding var currentRating : Int
    var width : Int
    var openSymbol : String
    var fillSybol : String
    var colorofIcon : Color
    
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 30, openSymbol: String, fillSybol: String, colorofIcon : Color) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.openSymbol = openSymbol
        self.fillSybol = fillSybol
        self.colorofIcon = colorofIcon
    }
    public var body: some View {
        HStack{
            ForEach(0..<self.maxRating){  rating in
                if #available(macOS 11.0, *) {
                    Image(systemName: rating < self.currentRating ? self.fillSybol : openSymbol)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(self.colorofIcon)
                        .onTapGesture {
                            self.currentRating = rating + 1
                        }
                } else {
                    // Fallback on earlier versions
                }
                
            }
        }.frame(width: CGFloat(self.maxRating * width))
    }
}

struct HeartRating_Previews: PreviewProvider {
    @available(macOS 10.15, *)
    static var previews: some View {
        HeartRatePac(maxRating: 5, currentRating: .constant(2), openSymbol: "star", fillSybol : "star.fill", colorofIcon: Color.red)
    }
}
