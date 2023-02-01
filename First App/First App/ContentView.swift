//
//  ContentView.swift
//  First App
//
//  Created by Daniel Shterev on 31.01.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingInfo = false
    private var info = "Nike was founded on January 25, 1964 as \"Blue Ribbon Sports\" by Bill Bowerman and Phil Knight.\nIt is the world's largest supplier of athletic shoes and apparel.\nThe brand valued alone is estimated at around $32 billion."
    var body: some View {
        if(!showingInfo)
        {
            VStack(alignment: .center) {
                Image("swoosh-logo-black")
                    .resizable().scaledToFit()
                Label("NIKE", systemImage: "none").font(.custom("Futura Bold", size: 34))
                Button("Show Info") {
                    showingInfo = true
                }.padding().background(Color.black).foregroundColor(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                    .font(.custom("Futura", size: 20))
                    .shadow(radius: 20)
            }
            .padding()
        }
        else
        {
            VStack {
                Image("swoosh-logo-black")
                    .resizable().position(x:50, y:-140).frame(width: 100, height: 100)
                Text(info).font(.custom("Futura", size: 20)).padding(.bottom, 50).italic()
                Button("Home") {
                    showingInfo = false
                }.padding().background(Color.black).foregroundColor(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                    .font(.custom("Futura", size: 20))
                    .shadow(radius: 20)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
