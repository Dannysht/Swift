//
//  DetailView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI

struct DetailView: View {
    @Binding var title: String
    @Binding var text:String
    var body: some View {
        VStack
        {
            TextField("New Note", text:$title)
            TextField("", text:$text)
        }
        .padding(.leading, 10)
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: .constant("test value"), text: .constant("test value"))
    }
}
