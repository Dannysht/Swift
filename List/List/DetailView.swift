//
//  DetailView.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//

import SwiftUI
import PhotosUI

struct DetailView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var image : UIImage?
    @Binding var title: String
    @Binding var note : Item
    var body: some View {
        NavigationStack
        {
            VStack
            {
                HStack
                {
                    Button("Save")
                    {
                        
                    }
                    Button("Delete image")
                    {
                        
                    }
                }
                VStack
                {
                    TextField("New Note", text:$title)
                    Image(uiImage: image ?? UIImage(systemName: "photo.circle.fill")!)
                    TextField("", text:$note.text)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()){
                    Text("Select a photo")
                }
                
            }
        }
        .onChange(of: selectedItem)
        {
            item in Task(priority: .background)
            {
                if let data = try? await item?.loadTransferable(type: Data.self)
                {
                    note.photo = UIImage(data: data)
                    image = note.photo
                    note.hasImage = true
                }
            }
        }
        .onAppear()
        {
            if note.hasImage
            {
                fService.downloadImage(note:note){
                    imageFromFB in image = imageFromFB
                }
            }
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
