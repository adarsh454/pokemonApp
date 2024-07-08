//
//  PokemonDetailView.swift
//  pokemonApp
//
//  Created by Adarsh Chaurasia on 21/05/24.
//

import SwiftUI
import Kingfisher

let sampleNPoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test another one test another onetest another onetest another onetest another one")

let sampleNVM = PokemonViewModel()


struct PokemonDetailView: View {
    
    let viewModel: PokemonViewModel
    let pokemon : Pokemon
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(
                colors:[Color.green.opacity(0.2), Color.pink.opacity(0.3)])
                           ,startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            
            ScrollView{
                GeometryReader { geometry in
    
                    
                    LazyVStack {
                        HStack{
                            Text(pokemon.name)
                                .font(.system(.body, design: .monospaced)).bold()
                                .textCase(.uppercase)
                        }
                        .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.4).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/))
                        .padding(10)
                        
                        HStack {
                            KFImage(URL(string: pokemon.imageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                        }
                        .frame(width: 300, height: 300)
                        .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.all, 6)
                        .shadow(color: .black, radius: 8, x: 8, y: 8)
                        .padding([.vertical, .horizontal] , 50)
                        
                        
                        VStack{
                            
                            VStack{
                                
                                HStack{
                                    Text(pokemon.description)
                                        .font(.system(.body, design: .monospaced)).bold()
                                        .frame(width: 350,height: 100)
                                }
                                
                            }
                            
                            VStack{
                                PokeMeter(textType: "attack", value: pokemon.attack)
                                    .padding(10)
                                PokeMeter(textType: "defense", value: pokemon.defense)
                                    .padding(10)
                                PokeMeter(textType: "weight", value: pokemon.weight)
                                    .padding(10)
                                PokeMeter(textType: "height", value: pokemon.height)
                                    .padding(10)
                            }
                            .frame(width: 350, height: 300)
                            .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .black, radius: 8, x: 8, y: 8)
                            .padding([.vertical, .horizontal], 20)
                            
                        }
                        
                    }
                    
                    
                    
                }
            }.frame(maxHeight: .infinity)
                .scrollBounceBehavior(.automatic)
                
        }
    }
}

#Preview {
    PokemonDetailView(viewModel: sampleNVM, pokemon: sampleNPoke)
}
//
//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View{
//        PokemonDetailView(viewModel: sampleNVM, pokemon: PokemonsampleNPoke)
//    }
//}
