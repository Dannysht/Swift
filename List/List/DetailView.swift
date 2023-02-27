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
    @Binding var image : UIImage
    var body: some View {
        VStack
        {
            TextField("New Note", text:$title)
            Image(uiImage: image)
            TextField("", text:$text)
        }
        .padding(.leading, 10)
        Spacer()
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: .constant("test value"), text: .constant("test value"), image: UIImage(contentsOfFile: "1*o4O4SdRfLDAbX2Z41mtUbQ"))
    }
}*/
