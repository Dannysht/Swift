//
//  ContentView.swift
//  moodlet
//
//  Created by Daniel Shterev on 14.03.23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var dayMood : DayMood
    @State var note : String = ""
    @State var quote : Quote
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        VStack{
            VStack
            {
                Text("Your mood today is: ").font(.title)
                Text(dayMood.mood.id)
                Text("Feel like sharing? ")
                NavigationLink(destination: NoteView(noteText: $note))
                {
                    
                    Text("Leave a note.").foregroundColor(dayMood.mood.moodColor)
                }
            }.background(RoundedRectangle(cornerRadius: 12).stroke(dayMood.mood.moodColor).frame(width: UIScreen.main.bounds.width - 10, height: 100))
                //.padding(16)
            Spacer()
                .frame(height: 50)
            VStack
            {
                    Text("Quote of the day: ").font(.title)
                    Text(quote.q)
                    Text(quote.a)
            }
            .background(RoundedRectangle(cornerRadius: 12).fill(dayMood.mood.moodColor)
                .frame(width: UIScreen.main.bounds.width - 10, height: 100))
                .foregroundColor(.white)
                .ignoresSafeArea()
            Spacer()
                .frame(height: 45)
            VStack
            {
                NavigationLink(destination: PreviousDays())
                {
                    HStack
                    {
                        Text("Check how you were feeling in previous days?")
                            .foregroundColor(.white)
                            .frame(width: 220 , height: 60)
                            .background(RoundedRectangle(cornerRadius: 12).fill(dayMood.mood.moodColor)).padding(.leading, 44)
                        Image(systemName: "hand.tap")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(dayMood.mood.moodColor)
                            .padding([.top, .trailing
                                     ], 11)
                        
                    }
                    
                }
                
            }
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dayMood: DayMood(note: "", mood: Mood(id: "Joy", moodColor: .red), date: Date()), quote: Quote(q: "Test", a: "Danny", h: "mlem"))
    }
}
