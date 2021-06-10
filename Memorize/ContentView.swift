//
//  ContentView.swift
//  Memorize
//
//  Created by Christoph on 21.05.21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
   
    var body: some View {
        VStack {
            gameMenuAndStatusBar
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards)  { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .padding(.horizontal)
        }
    }
    
    var gameMenuAndStatusBar: some View {
        HStack {
            newGameButton
                .padding(10)
            Spacer()
            Text("Points: \(viewModel.score)")
            Spacer()
            Text("Theme: \(viewModel.themeName)")
                .padding(10)
        }
    }
    
    var newGameButton: some View {
          Button {
            viewModel.newGame()
          } label: {
            Text("New Game")
                .padding(10)
                .foregroundColor(Color.white)
                .background(viewModel.themeColor)
                .cornerRadius(40)
          }
      }

}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
