//
//  NotificationsAction.swift
//  Cocktails
//
//  Created by Apple  on 29/05/2022.
//

import Foundation
import Combine

class NotificationActions {
    
    var cancellables = Set<AnyCancellable>()
    let action = PassthroughSubject<Item, Never>()

}
