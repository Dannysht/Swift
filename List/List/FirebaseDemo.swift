//
//  FirebaseDemo.swift
//  List
//
//  Created by Daniel Shterev on 21.02.23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit
var fService = FirebaseDemo()

class FirebaseDemo:ObservableObject
{
    private var db = Firestore.firestore()
    private var storage = Storage.storage()
    private let collection = "notes"
    @Published var notes = [Item]()
    
    func downloadImage(note : Item, completion: @escaping (UIImage?) -> Void)
    {
        let imageRef = storage.reference(withPath: note.id)
        imageRef.getData(maxSize: 5000000)
        {
            data, error in
            if error == nil
            {
                completion(UIImage(data: data!))
            }
            else
            {
                print("error downloading \(error.debugDescription)")
            }
        }
    }
    
    func addImage()
    {
        if let img = UIImage(named: "1*o4O4SdRfLDAbX2Z41mtUbQ")
        {
            let data = img.pngData()!
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
            let ref = storage.reference().child("1*o4O4SdRfLDAbX2Z41mtUbQ.png")
            ref.putData(data, metadata: metaData)
            {
                meta, error in
                if error == nil
                {
                    print("Uploading img")
                }
                else
                {
                    print("Cant Upload img")
                }
            }
        }
    }
    
    func addItem(title:String, text:String)
    {
        let doc = db.collection(collection).document()
        var data = [String:String]()
        data["title"] = title
        data["text"] = text
        doc.setData(data)
    }
    
    func deleteImage(note: Item)
    {
        
    }
    
    func uploadImage(note: Item)
    {
        
    }
    
    func updateNote(note:Item)
    {
        if note.photo != nil
        {
            uploadImage(note: note)
        }
        if !note.hasImage
        {
            deleteImage(note:note)
        }
        let doc = db.collection(collection).document(note.id)
        var data = [String:Any]()
        data["title"] = note.title
        data["text"] = note.text
        data["hasImage"] = note.hasImage
        doc.setData(data)
    }
    
    
    
    func startListener()
    {
        db.collection(collection).addSnapshotListener {snapshot, error in
            if error == nil
            {
                if let snap = snapshot
                {
                    self.notes.removeAll()
                    for doc in snap.documents
                    {
                        if let string = doc.data()["text"] as? String, let title = doc.data()["title"] as? String, let hasImage = doc.data()["hasImage"] as? Bool
                        {
                            if hasImage
                            {
                                let imageRef = self.storage.reference(withPath:doc.data()["id"] as! String)
                                imageRef.getData(maxSize: 5000000)
                                {
                                    data, error in
                                    if error == nil
                                    {
                                        let image = UIImage(data: data!)
                                        let n = Item(id: doc.documentID, title:title, text: string, photo: image!)
                                        self.notes.append(n)
                                    }
                                    else
                                    {
                                        print("error downloading \(error.debugDescription)")
                                    }
                                }
                            }
                            
                            print(string)
                        }
                    }
                }
            }
            else
            {
                
            }
        }
    }
    
}
