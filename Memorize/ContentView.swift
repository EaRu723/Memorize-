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
    let emojis:Array<String> = ["💀","👻","🎃","🧙‍♀️"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self){index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
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
