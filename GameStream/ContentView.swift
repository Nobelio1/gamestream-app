//
//  ContentView.swift
//  GameStream
//
//  Created by Gino Alejandro on 18/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Spacer()
                
                Color("marine").ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 40)
                    
                    InicioRegistroView()
                    
                }
                
            }
        }
    }
}

#Preview("Vista 1") {
    ContentView()
}

