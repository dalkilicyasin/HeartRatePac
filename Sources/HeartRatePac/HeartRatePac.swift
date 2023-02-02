//
//  HeartRating.swift
//  HeartRating
//
//  Created by Yasin Dalkilic on 2.02.2023.
//

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
struct HeartRatePac: View {
    var maxRating : Int 
    @Binding var currentRating : Int
    var width = 30
    var openSymbol : String
    var fillSybol : String
    var body: some View {
        HStack{
            ForEach(0..<self.maxRating){  rating in
                if #available(macOS 11.0, *) {
                    Image(systemName: rating < self.currentRating ? self.fillSybol : openSymbol)
                        .resizable()
                        .scaledToFit()
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
        HeartRatePac(maxRating: 5, currentRating: .constant(2), openSymbol: "star", fillSybol : "star.fill")
    }
}
