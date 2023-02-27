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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
