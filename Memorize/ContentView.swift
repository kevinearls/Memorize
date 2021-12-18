//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Earls on 14/12/2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️",  "🚃", "🚅", "🚁", "🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚢", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍"]
    @State var emojiCount = 16
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(Color.red)
            Spacer()
            HStack {
                addButton
                Spacer()
                removeButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
       
    }
    
    var removeButton: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }  , label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var addButton: some View {
        Button(action: {
            if emojiCount < emojis.count {
                    emojiCount += 1
            }
        }  , label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool=true
    
    var body: some View {
        let shape=RoundedRectangle(cornerRadius: 20.0)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture(perform: { isFaceUp = !isFaceUp } )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        //ContentView().preferredColorScheme(.dark)
    }
   
}
