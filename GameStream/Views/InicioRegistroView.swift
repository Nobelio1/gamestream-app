//
//  InicioRegistroView.swift
//  GameStream
//
//  Created by Gino Alejandro on 18/01/25.
//

import SwiftUI

struct InicioRegistroView: View {
    
    @State var tipoInicioSesion: Bool = true
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    
                }
                .foregroundStyle(tipoInicioSesion ? Color.white : Color.gray)
                .bold()
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                }
                .foregroundStyle(!tipoInicioSesion ? Color.white : Color.gray)
                .bold()
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                
                InicioSesionView()
                
            } else{
                
                RegistroView()
                
            }
        }
    }
}

#Preview {
    InicioRegistroView()
}
