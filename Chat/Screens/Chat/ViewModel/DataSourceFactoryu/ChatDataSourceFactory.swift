//
//  ChatDataSourceFactory.swift
//  Chat
//
//  Created by Paweł Bednorz on 25/06/2021.
//

import Foundation
import RxDataSources

final class ChatDataSourceFactory {
    private let relativeTimeFormmater: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter
    }()
}

extension ChatDataSourceFactory: ChatDataSourceFactoryProtocol {
    
    func make(with messages: [Message]) -> [SectionModel<String, ChatCell.Model>] {
        let items = messages.map { message in
            ChatCell.Model(avater: message.avater,
                           username: message.username,
                           relativeTime: relativeTimeFormmater.localizedString(for: message.timestamp,
                                                                               relativeTo: Date()),
                           message: message.content) }
        
        return [SectionModel<String, ChatCell.Model>(model: "", items: items)]
    }
}
