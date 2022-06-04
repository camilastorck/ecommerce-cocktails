//
//  NetworkManager.swift
//  Cocktails
//
//  Created by Apple  on 31/05/2022.
//

import Foundation
import Combine

class NetworkManager {
    
    func requestData() -> AnyPublisher<[Item], Error> {
        
        let path = Bundle.main.path(forResource: "Items", ofType: ".json", inDirectory: "Resources")!
        let url = URL(fileURLWithPath: path)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Item].self, decoder: JSONDecoder())
            .map { $0.self }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
