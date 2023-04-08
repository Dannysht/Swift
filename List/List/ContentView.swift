//
//  ContentView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI

struct ContentView: View
{
    //@EnvironmentObject var noteManager:NoteManager
    @ObservedObject var demoFirebase = FirebaseDemo()
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Button("Add")
                {
                    
                    demoFirebase.addItem(title: "New Note", text: "")
                }
                List($demoFirebase.notes)
                {
                    item in
                    NavigationLink(destination: DetailView(title: item.title, note: item))
                    {
                        Text(item.title.wrappedValue)
                    }
                }
            }.background().onAppear()
            {
                
                //demoFirebase.addItem(text: "Hello")
                demoFirebase.startListener()
                demoFirebase.addImage()
            }
        }
    }
}

class Item:Identifiable
{
    init(id: String, title:String, text:String, photo:UIImage)
    {
        self.id = id
        self.title = title
        self.text = text
        self.photo = photo
    }
    var hasImage : Bool = false
    var id : String
    var title:String
    var photo:UIImage? = nil
    var text:String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FirebaseDemo())
    }
}
