//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//
// SwiftUI View for the Emoji Memory Game. It includes a grid of cards and a shuffle button

import SwiftUI
#Preview {
    EmojiMemoryGameView()
}
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    // the main view body
    var body: some View {
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            // shuffle button
            Button("Shuffle"){
                viewModel.shuffle()
            }
            .padding()
        }
        
    }
    
    // grid view of cards
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) {card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }

    // View for each individual card
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        // the body of the card view
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1:0)
                base.fill()
                    .opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0 )
        }
    }
    
    
    
    
    
    
    
    
    
    
    // preview provider for the EmojiMemoryGameView
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View{
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
    
}
