//
//  Int+Abbrevation.swift
//  PokerTime
//
//  Created by Tomi Lahtinen on 13/04/2018.
//  Copyright © 2018 Tomi Lahtinen. All rights reserved.
//

import Foundation

extension Int {
    func formatUsingAbbreviation () -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbreviation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbreviation] = [(1, 1, ""),
                                           (10000.0, 1000.0, "K"),
                                           (1_000_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        let startValue = Double (abs(self))
        let abbreviation:Abbreviation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.maximumIntegerDigits = 4
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 0
        return numFormatter.string(from: NSNumber (value:value))!
    }
}
