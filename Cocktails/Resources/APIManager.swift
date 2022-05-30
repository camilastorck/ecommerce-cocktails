//
//  APIManager.swift
//  Cocktails
//
//  Created by Apple  on 28/05/2022.
//

import Foundation
import Combine

class APIManager {
    
    private var notifications: NotificationActions
    
    init(notifications: NotificationActions) {
        self.notifications = notifications
    }
    
    func requestData() {
        
        guard let path = Bundle.main.path(forResource: "Items", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [Item].self, decoder: JSONDecoder())
            //.replaceError(with: []) // Instead of completion.
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished!")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { items in
                
            }
            .store(in: &notifications.cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        return output.data
    }
}
