//
//  Main.swift
//  moodlet
//
//  Created by Daniel Shterev on 22.03.23.
//

import SwiftUI

struct Quote : Hashable, Codable
{
    var q : String
    var a : String
    var h : String
}
class QuoteView: ObservableObject
{
    @Published var quote : [Quote] = []
    
    func fetch()
    {
        guard let url = URL(string: "https://zenquotes.io/api/today") else
        {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data, error == nil else { return }
            do{
                 let quote = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    self.quote = quote
                }
            }
            catch
            {
                print("Died")
                let quote = [Quote(q: "Hello", a: "Daniel Shterev", h: "empty")]
                DispatchQueue.main.async {
                    self.quote = quote
                }
            }
        }
         
        

        task.resume()
    }
}

struct MainView: View {
    
    //var quote =
    @State private var selection : Mood = Mood(id:"Joy", moodColor: Color.yellow)
    @State var moods : Array = [Mood(id:"Anger", moodColor: Color.red), Mood(id:"Surprise", moodColor: Color.purple), Mood(id: "Disgust", moodColor: Color.brown), Mood(id:"Joy", moodColor: Color.yellow), Mood(id:"Fear", moodColor: Color.orange), Mood(id:"Sadness", moodColor: Color.indigo), Mood(id:"Trust", moodColor: Color.green)]
    @StateObject var quoteView = QuoteView()
    
    var body: some View {
        NavigationView()
        {
            VStack
            {
                Spacer()
                Text("Today's mood?").font(.title)
                Picker("Select your mood today", selection: $selection)
                {
                    ForEach(moods)
                    {
                        mood in
                        Text(mood.id).tag(mood).foregroundColor(mood.moodColor)
                    }
                }.pickerStyle(.wheel)
                Spacer()
                ForEach(quoteView.quote, id: \.self)
                {
                    quote in
                    NavigationLink(destination: ContentView(dayMood: DayMood(note: "", mood: selection, date: Date()), quote: quote))
                    {
                        Text("Continue")
                            .background(RoundedRectangle(cornerRadius: 12).fill(selection.moodColor).frame(width: UIScreen.main.bounds.width + 20, height: 120))
                                        .foregroundColor(.white)
                                        .ignoresSafeArea()
                            
                    }
                }
                
            }
            
        }
        .onAppear()
        {
            quoteView.fetch()
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(selection.moodColor)
        
    }
}

/*struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selection: Mood(mood:"Anger", moodColor: Color.red))
    }
}*/
