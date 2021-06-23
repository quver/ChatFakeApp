//
//  ChatViewModelProtocol.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import RxSwift
import RxCocoa
import RxDataSources

protocol ChatViewModelProtocol {
    /// Table view data source.
    var dataSource: Observable<[SectionModel<String, ChatCell.Model>]> { get }
    
    /// Text field content.
    var textFieldContent: PublishRelay<String?> { get }
    
    /// User did tap on the send button.
    var sendButtonDidTap: PublishRelay<Void> { get }
}
