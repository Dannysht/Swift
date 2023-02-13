//
//  ContentView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI

struct ContentView: View
{
    @State var items = [
        Item(t: "One", te:"qm"),
        Item(t: "Two", te:"")
    ]
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Button("Add")
                {
                    
                    items.append(Item(t:"New Note", te: ""))
                }
                List($items)
                {
                    item in
                    NavigationLink(destination: DetailView(title: item.title, text: item.text))
                    {
                        Text(item.title.wrappedValue)
                    }
                }
            }.background()
        }
    }
}

class Item:Identifiable
{
    init(t:String, te:String)
    {
        title = t
        text = te
    }
    var id = UUID()
    var title:String
    var text:String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
