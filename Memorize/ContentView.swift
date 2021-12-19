//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Earls on 14/12/2021.
//

import SwiftUI

struct ContentView: View {
    //@State var emojis = ["✈️",  "🚃", "🚅", "🚁", "🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚢", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍"]
    @State var emojis: [String] = []
    var vehicles =  ["✈️",  "🚃", "🚅", "🚁", "🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚢", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍"]
    var fruits = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑"]
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦"]
    
    @State var emojiCount = 12
    
    var body: some View {
        VStack {
            Text( "Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(Color.red)
            Spacer()
            // Refactor?
            HStack {
                animalsButton
                Spacer()
                vehicleButton
                Spacer()
                fruitButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            HStack {
                Text("Animals")
                Spacer()
                Text("Vehicles")
                Spacer()
                Text("Fruits")
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
       
    }
    
    var fruitButton: some View {
        Button(action: {
            emojis = fruits.shuffled()
        }  , label: {
            Image(systemName: "applelogo")
        })
    }
    
    var animalsButton: some View {
        Button(action: {
            emojis = animals.shuffled()
        }  , label: {
            Image(systemName: "hare")
        })
    }
    
    var vehicleButton: some View {
        Button(action: {
            emojis = vehicles.shuffled()
        }  , label: {
            Image(systemName: "car")
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
