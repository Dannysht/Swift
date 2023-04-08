//
//  IntroSlmoodes.swift
//  moodlet
//
//  Created by Daniel Shterev on 14.03.23.
//

import SwiftUI

struct IntroSlides1: View {
    
    
    var body: some View {
        NavigationView()
        {
            VStack
            {
                Spacer()
                Text("What is moodlet?").font(.title)
                    .frame(alignment: .center)
                Text("moodlet is an app that helps you track your mood throughout the day - everyday.").padding(.top, 5)
                Spacer()
                NavigationLink(destination: MainView())
                {
                    Text("Pick your mood for today").background(RoundedRectangle(cornerRadius: 12).fill(.purple).frame(width: UIScreen.main.bounds.width + 20, height: 120))
                        .foregroundColor(.white)
                        
                }
            }
        }
    }
}

struct IntroSlides_Previews: PreviewProvider {
    static var previews: some View {
        IntroSlides1()
    }
}
