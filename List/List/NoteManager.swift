//
//  NoteManager.swift
//  List
//
//  Created by Daniel Shterev on 14.02.23.
//

/*import Firebase

class NoteManager: ObservableObject
{
    let db = Firestore.firestore()
    init()
    {
        fetchNotes()
    }
    
    @Published var notes: [Item] = []
    
    func fetchNotes()
    {
        notes.removeAll()
        let ref = db.collection("Notes")
        ref.getDocuments{ snapshot, Error in guard Error == nil else
            {
            print(Error!.localizedDescription)
            return
        }
            
            if let snapshot = snapshot {
                for document in snapshot.documents
                {
                    let data = document.data()
                    let title = data["title"] as? String ?? ""
                    let text = data["text"] as? String ?? ""
                    let note = Item(title: title, text: text)
                    self.notes.append(note)
                }
            }
        }
    }
    
    func addNote(title:String, text:String)
    {
        let db = Firestore.firestore()
        let ref = db.collection("Notes").document(title)
        ref.setData(["title": title, "text" : text]){
            error in
            if let  error = error{
                print(error.localizedDescription)
            }
            
        }
    }
    
    func startListener()
    {
        db.collection("Notes").addSnapshotListener{snap, error in
            if let e = error
            {
                print(e.localizedDescription)
                
            }
            else
            {
                if let snap = snap
                {
                    for document in snap.documents
                    {
                        if let text = document.data()["text"] as? String
                        {
                            print(text)
                        }
                    }
                }
            }
        }
    }
    
    func saveChanges()
    {
        notes.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Notes").document()
        for note in notes
        {
            ref.setData(["title":note.title, "text":note.text])
            {
                error in
                if let  error = error{
                    print(error.localizedDescription)
                }
            }
        }

    }
    
    
    
}
*/
