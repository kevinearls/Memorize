//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Earls on 14/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3.0)
            
            Text("Hello, world!")

        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
