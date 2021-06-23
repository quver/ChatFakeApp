//
//  MessagesRepository.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import RxSwift
import RxRelay

final class MessagesRepository {
    private var messages: [Message] {
        didSet {
            messagesSubject.onNext(messages)
        }
    }
    
    private lazy var messagesSubject = BehaviorSubject<[Message]>(value: messages)
    
    init(messagesGenerator: MessagesGeneratorProtocol = MessagesGeneator()) {
        messages = messagesGenerator.generate()
    }
    
}

extension MessagesRepository: MessagesRepositoryProtocol {
    
    var allMessage: Observable<[Message]> { messagesSubject }
    
    func add(_ message: Message) {
        var messageCopy = messages
        messageCopy.append(message)
        messageCopy.sort { $0.timestamp > $1.timestamp }
        
        messages = messageCopy
    }
}
