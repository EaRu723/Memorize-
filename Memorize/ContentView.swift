//
//  ContentView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//
import SwiftUI
#Preview {
    ContentView()
}
struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            var base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🧂") .font(.largeTitle)
            }
            else {
                base.fill()
                    
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
