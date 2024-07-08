//
//  PokeMeter.swift
//  pokemonApp
//
//  Created by Adarsh Chaurasia on 02/07/24.
//

import SwiftUI

struct PokeMeter: View {
    
    let textType : String
    var value : Int
    
    
    var body: some View {
        HStack{
            
            Text("\(textType) :: \(value)")
                .textCase(.uppercase)
                .font(.system(.body, design: .monospaced)).bold()
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 150, height: 20)
              
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.blue)
                    .frame(width: addValue(x: value) ,height: 20)
                
            }
        }
    }
    
    func addValue(x:Int) -> CGFloat{
        var x = x + 50
        if(x>200){
            x = x/100
        }
        return CGFloat(x);
    }
}

#Preview {
    PokeMeter(textType: "hello", value: 59)
}
