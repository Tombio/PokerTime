//
//  Style.swift
//  PokerTime
//
//  Created by Tomi Lahtinen on 12/04/2018.
//  Copyright © 2018 Tomi Lahtinen. All rights reserved.
//

import Foundation
import UIKit

struct Style {
    let onColor: UIColor
    let offColor: UIColor
}

enum Styles {
    static let green = Style(onColor: #colorLiteral(red: 0, green: 0.8745098039, blue: 0.1058823529, alpha: 1), offColor: #colorLiteral(red: 0.1058823529, green: 0.2039215686, blue: 0.1176470588, alpha: 1))
    static let red = Style(onColor: #colorLiteral(red: 0.968627451, green: 0, blue: 0.1529411765, alpha: 1), offColor: #colorLiteral(red: 0.2509803922, green: 0.1294117647, blue: 0.1490196078, alpha: 1))
}
