//
//  MessagesGeneratorProtocol.swift
//  Chat
//
//  Created by Paweł Bednorz on 25/06/2021.
//

protocol MessagesGeneratorProtocol {
    
    /// Generates random messages. Quite stupid messages.
    func generate() -> [Message]
}
