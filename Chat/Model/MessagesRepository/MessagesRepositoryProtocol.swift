//
//  MessagesRepositoryProtocol.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import RxSwift

protocol MessagesRepositoryProtocol {
    
    /// All messages observable sequence.
    var allMessage: Observable<[Message]> { get }
    
    /// Adds message to the repository.
    /// - Parameter message: Message to add.
    func add(_ message: Message)
}
