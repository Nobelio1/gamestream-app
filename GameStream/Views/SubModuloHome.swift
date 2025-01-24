//
//  SubModuloHome.swift
//  GameStream
//
//  Created by Gino Alejandro on 20/01/25.
//

import SwiftUI
import AVKit

struct SubModuloHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    @State var isGameInfoEmpty = false
    
    @State var textBusqueda: String = ""
    
    func buscar(name: String){
        print("El usuario esta buscando \(textBusqueda)")
        isGameInfoEmpty.toggle()
    }
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Button{
                    buscar(name: textBusqueda)
                }label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(textBusqueda.isEmpty
                                         ? Color.yellow
                                         : Color("DarkCyan"))
                }.alert(isPresented: $isGameInfoEmpty){
                    Alert(
                        title: Text("Error"),
                        message: Text("No se encontró el juego"),
                        dismissButton: .default(Text("Entendido"))
                    )
                }
                
                ZStack (alignment: .leading){
                    if textBusqueda.isEmpty{
                        Text("Buscar un video")
                            .foregroundStyle(Color(red: 174/255, green: 177/255 ,blue:185/255))
                    }
                    
                    TextField("", text: $textBusqueda)
                        .foregroundStyle(Color.white)
                }
                
            }
            .padding([.top, .leading, .bottom], 11.0)
            .background(Color("blue-gray"))
            .clipShape(Capsule())

            
            
            //MARK: MAS POPULARES
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundStyle(Color.white)
                .bold()
                .frame(minWidth: 0,maxWidth: .infinity)
                .padding(.top)
            
            ZStack{
                
                Button{
                    url = urlVideos[0]
                    print(url)
                    isPlayerActive = true
                }label: {
                    VStack(spacing: 0){
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFill()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("blue-gray"))
                    }
                }
                .navigationDestination(
                    isPresented: $isPlayerActive,
                    destination: {
                            VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 300)
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundStyle(Color.white)
                    .frame(width: 40, height: 40)
                    
                
            }
                
            //MARK: CATEGORIA SUGERIDAS
            Text("CATEGORIAS")
                .font(.title3)
                .foregroundStyle(Color.white)
                .bold()
                .frame(minWidth: 0,maxWidth: .infinity)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button{
                        //dd
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                                
                            
                            
                        }
                    }
                    
                    Button{
                        //dd
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                                
                            
                            
                        }
                    }
                    
                    Button{
                        //dd
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                                
                            
                            
                        }
                    }
                }
            }
            
            //MARK: RECOMENDADOS PARA TI
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundStyle(Color.white)
                .bold()
                .frame(minWidth: 0,maxWidth: .infinity)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    Button{
                        url = urlVideos[1]
                        print(url)
                        isPlayerActive = true
                    }label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button{
                        url = urlVideos[2]
                        print(url)
                        isPlayerActive = true
                    }label: {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button{
                        url = urlVideos[3]
                        print(url)
                        isPlayerActive = true
                    }label: {
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    
                    
                }
            }
        }
        
    }
}

#Preview {
    SubModuloHome()
}
