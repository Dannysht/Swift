//
//  mood.swift
//  moodlet
//
//  Created by Daniel Shterev on 22.03.23.
//

import Foundation
import SwiftUI

class Mood : Identifiable, Hashable
{
    static func == (lhs: Mood, rhs: Mood) -> Bool {
        return lhs.id == rhs.id && lhs.moodColor == rhs.moodColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(moodColor)
    }
    
    var id : String
    var moodColor : Color
    
    init(id: String, moodColor: Color)
    {
        self.id = id
        self.moodColor = moodColor
    }
}
