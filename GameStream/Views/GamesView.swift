//
//  GamesView.swift
//  GameStream
//
//  Created by Gino Alejandro on 21/01/25.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        ZStack{
                
                   Color("marine").ignoresSafeArea()
                   
                   VStack{
                       Text("Juegos")
                           .font(.title2)
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                       
                       ScrollView{
                           
                           LazyVGrid(columns:formaGrid,spacing:8){
                               
                               ForEach(allVideoGames.gamesInfo, id: \.self){ juego in
                                   
                                   Button{
                                       
                                       url = juego.videosUrls.mobile
                                       titulo = juego.title
                                       studio = juego.studio
                                       calificacion = juego.contentRaiting
                                       anoPublicacion = juego.publicationYear
                                       descripcion = juego.description
                                       tags = juego.tags
                                       imgsUrl = juego.galleryImages
                            
                                       print("Pulse el juego \(titulo)")
                                       
                                       gameviewIsActive = true
                                       
                                   }label: {

                                       AsyncImage(url: URL(string: juego.galleryImages[0])){img in
                                           img.image?.resizable()
                                       }
                                           .aspectRatio(contentMode: .fit)
                                           .padding(.bottom,12)
                                           .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                   }
                               }
                           }
                       }
      
                   }.padding(.horizontal,6)
            
            
                NavigationLink(value: "games"){
                    EmptyView()
                }.navigationDestination(isPresented: $gameviewIsActive ){
                    GameView(
                        url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl
                    )
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("primer elemento en Json \(allVideoGames.gamesInfo[0])")
                }
            )
    }
}

#Preview {
    GamesView()
}
