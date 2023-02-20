//
//  ListApp.swift
//  List
//
//  Created by Daniel Shterev on 7.02.23.
//
import SwiftUI
import FirebaseCore

@main
struct ListApp: App {
    @StateObject var noteManager = NoteManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(noteManager)
        }
    }
}
