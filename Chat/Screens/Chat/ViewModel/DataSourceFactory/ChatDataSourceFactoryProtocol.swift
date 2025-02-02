//
//  ChatDataSourceFactoryProtocol.swift
//  Chat
//
//  Created by Paweł Bednorz on 25/06/2021.
//

import RxDataSources

protocol ChatDataSourceFactoryProtocol {
    /// Makes chat data source section.
    /// - Parameter messages: Chat messages.
    func make(with messages: [Message]) -> [SectionModel<String, ChatCell.Model>]
}
