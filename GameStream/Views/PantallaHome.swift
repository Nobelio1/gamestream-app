//
//  PantallaHome.swift
//  GameStream
//
//  Created by Gino Alejandro on 20/01/25.
//

import SwiftUI

struct PantallaHome: View {
    
    
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                
                                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                }
                
            }.padding(.horizontal,18)
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PantallaHome()
}
