//
//  DayMood.swift
//  moodlet
//
//  Created by Daniel Shterev on 24.03.23.
//

import Foundation

class DayMood
{
    var note : String
    var mood : Mood
    var date : Date
    
    init(note: String, mood: Mood, date: Date) {
        self.note = note
        self.mood = mood
        self.date = date
    }
    
}
