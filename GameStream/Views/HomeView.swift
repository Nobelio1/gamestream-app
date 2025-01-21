//
//  HomeView.swift
//  GameStream
//
//  Created by Gino Alejandro on 20/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSelecionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSelecionado) {
            
            Text("Esto es el Perfil")
                .bold()
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(0)
                .toolbarBackground(Color.white, for: .tabBar)
            
            GamesView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }
                .tag(1)
                .toolbarBackground(Color.white, for: .tabBar)
            
            
            PantallaHome()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                }
                .tag(2)
                .toolbarBackground(Color.white, for: .tabBar)
            
            Text("Esto es el favotiros")
                .bold()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
                .tag(3)
                .toolbarBackground(Color.white, for: .tabBar)
            
        }.onAppear(){
            UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
            UITabBar.appearance().isTranslucent = true
        }.accentColor(.white)
        
    }
}

#Preview {
    HomeView()
}
