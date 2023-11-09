//
//  ContentView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {content:
            if isFaceUp{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(lineWidth: 5)
                Text("🧂") .font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    
            }
        }
    }
}
