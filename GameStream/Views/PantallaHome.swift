//
//  PantallaHome.swift
//  GameStream
//
//  Created by Gino Alejandro on 20/01/25.
//

import SwiftUI

struct PantallaHome: View {
    
    @State var textBusqueda: String = ""
    
    func buscar(){
        print("El usuario esta buscando \(textBusqueda)")
    }
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                
                HStack{
                    
                    Button{
                        buscar()
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(textBusqueda.isEmpty
                                             ? Color.yellow
                                             : Color("DarkCyan"))
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
