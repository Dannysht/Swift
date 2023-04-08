//
//  PreviousDays.swift
//  moodlet
//
//  Created by Daniel Shterev on 24.03.23.
//

import SwiftUI

struct PreviousDays: View {
    @State var dateToday : Date = Date()
    var body: some View {
        VStack
        {
            DatePicker("Check how you were feeling in previous days?", selection:$dateToday, displayedComponents: .date)
                .datePickerStyle(.graphical).accentColor(.green)
        }
        .navigationTitle("Check how you were feeling in previous days?")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct PreviousDays_Previews: PreviewProvider {
    static var previews: some View {
        PreviousDays()
    }
}
