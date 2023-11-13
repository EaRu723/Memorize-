//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//
import SwiftUI
#Preview {
    EmojiMemoryGameView()
}
struct EmojiMemoryGameView: View {
    var ViewModel: EmojiMemoryGame
    let emojis:Array<String> = ["💀","👻","🎃","🧙‍♀️","😵","🦷","🥸","🫥","🫨","😈","👿","👹"]
    
    var body: some View {
            ScrollView{
                cards
            }
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self){index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}
 
struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
