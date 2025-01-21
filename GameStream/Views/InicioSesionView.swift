//
//  InicioSesionView.swift
//  GameStream
//
//  Created by Gino Alejandro on 19/01/25.
//

import SwiftUI

struct InicioSesionView: View {
    
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var isActiveHomeView: Bool = false
    
    func inciarSesion() {
        isActiveHomeView = true
    }

    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                Text("Correo Electronico").foregroundStyle(Color("DarkCyan"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                        Text(verbatim:"ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                
                    TextField("", text:$correo)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCyan"))
                    .padding(.bottom)
                
                Text("Contraseña").foregroundStyle(Color(.white))
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                        Text("********")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                
                    SecureField("", text: $contrasena)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCyan"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .foregroundStyle(Color("DarkCyan"))
                    .frame(width: 335, alignment: .trailing)
                    .padding(.bottom)
                
                Button {
                    inciarSesion()
                }label: {
                    Text("INICIAR SESION")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color("DarkCyan"),lineWidth: 1)
                                .shadow(color: .white, radius: 6)
                        )
                        
                }.padding(.bottom, 40)
                
                
                Text("Iniciar Sesión con redes sociales")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,20)
                
                HStack(alignment: .center){
                    ZStack{
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(Color("blue-gray"))
                        Text("Facebook")
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 10)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(Color("blue-gray"))
                        Text("Twitter")
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 10)
                    }

                }
                 
                
            }.padding(.horizontal, 77)
            
            NavigationLink(value: "home"){
                EmptyView()
            }.navigationDestination(isPresented: $isActiveHomeView ){
                HomeView()
            }
        }
    }
}

#Preview {
    InicioSesionView()
}
