//
//  ViewModel.swift
//  GameStream
//
//  Created by Gino Alejandro on 21/01/25.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var gamesInfo: [Game] =  [Game]()
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        
        guard let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games") else {
                print("URL inválida")
                return
            }
        
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error en la solicitud: \(error.localizedDescription)")
                    return
                }


                if let httpResponse = response as? HTTPURLResponse {
                    print("Código de respuesta: \(httpResponse.statusCode)")
                }


                guard let data = data else {
                    print("No se recibió data")
                    return
                }


                do {
                    let games = try JSONDecoder().decode([Game].self, from: data)
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: games)
                    }
                    
                    
                } catch {
                    print("Error al decodificar JSON: \(error.localizedDescription)")
                }
            
        }.resume()
        
        
    }
    
}
