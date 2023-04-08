//
//  NoteView.swift
//  moodlet
//
//  Created by Daniel Shterev on 22.03.23.
//

import SwiftUI

struct NoteView: View {
    
    @Binding var noteText : String
    var body: some View {
        ScrollView
        {
            TextField("Click here to type...",text: $noteText, axis: .vertical)
                .lineLimit(50...100)
        }
        .navigationTitle("How are you feeling today?")
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(noteText: .constant("Privet"))
    }
}
