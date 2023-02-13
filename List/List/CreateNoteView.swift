//
//  CreateNoteView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI

struct CreateNoteView: View {
    @State var title:String
    @State var text:String
    @Binding var list:[Item]
    var body: some View {
        HStack
        {
            
            VStack
            {
                TextField("New Note", text: $title)
                TextField("Note goes here", text:$text, axis: .vertical)
                    Spacer()
            }.padding(25)
            Button("Save")
            {
                list.append(Item(t: title, te: text))
            }.position(x:130, y:-23)
        }
        
        
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView(title: "", text: "", list:.constant([Item]()))
    }
}

