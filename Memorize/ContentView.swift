//
//  ContentView.swift
//  Memorize
//
//  Created by Christoph on 21.05.21.
//

import SwiftUI

let vehicles = ["🚗","🚕","🏎","✈️","🚜","🛶","🚡","🦼","🚛","🚁","🚤","🛸","🚲","🛵","🛴","🛰","🚂","🛺","🚀","🚑","🚐","🛻","🚚","🏍"]
let faces = ["😀","🥰","😙","😭","🥸","🤯","🥳","😂","😤"]
let animals = ["🐶","🐴","🦄","🦁","🐥","🙈","🐝","🐽","🐬","🦧","🦖","🐢"]

struct ContentView: View {
    
    
    @State var emojis = vehicles
    
    @State var emojiCount = 4
    
   
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self)  { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                vehiclesButton
                Spacer()
                animalsButton
                Spacer()
                facesButton
                Spacer()
                
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
             
    }
    
    var vehiclesButton: some View {
        Button {
            emojis = vehicles.shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
            }
        }
    }
    
    var animalsButton: some View {
        Button {
            emojis = animals.shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "tortoise")
                    .font(.largeTitle)
                Text("Animals")
            }
        }
    }
    
    var facesButton: some View {
        Button {
            emojis = faces.shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("Faces")
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



func widthThatBestFits(cardCount: Int) -> CGFloat {
    var widthThatBestFits = 65
    if (cardCount <= 4 ) {
        widthThatBestFits = 175
    }
    else if (cardCount > 4 && cardCount < 10) {
        widthThatBestFits = 114
    }
    else if (cardCount >= 10 && cardCount < 17) {
        widthThatBestFits = 83
    }
    return CGFloat(widthThatBestFits)
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
