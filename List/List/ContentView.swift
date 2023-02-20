//
//  ContentView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var noteManager:NoteManager
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Button("Add")
                {
                    let item = Item(title:"New Note", text: "")
                    noteManager.notes.append(item)
                    noteManager.addNote(title: item.title, text: item.text)
                    
                }
                List($noteManager.notes)
                {
                    item in
                    NavigationLink(destination: DetailView(title: item.title, text: item.text))
                    {
                        Text(item.title.wrappedValue)
                    }
                }
            }.background().onAppear()
            {
                noteManager.startListener()
            }
        }
    }
}

class Item:Identifiable
{
    init(title:String, text:String)
    {
        self.title = title
        self.text = text
    }
    var id = UUID()
    var title:String
    var text:String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NoteManager())
    }
}
