//
//  ChatViewModel.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class ChatViewModel {
    private enum Constants {
        static let username = "John Applesed"
        static let refreshInterval = 5
    }
    
    let textFieldContent = PublishRelay<String?>()
    let sendButtonDidTap = PublishRelay<Void>()
    
    private let messagesRepository: MessagesRepositoryProtocol
    private let dataSourceFactory: ChatDataSourceFactoryProtocol
    private let disposeBag = DisposeBag()
    
    private lazy var refreshTrigger = Observable<Int>.interval(.seconds(Constants.refreshInterval),
                                                               scheduler: MainScheduler.asyncInstance)
        .startWith(0)
    
    init(messagesRepository: MessagesRepositoryProtocol = MessagesRepository(),
         dataSourceFactory: ChatDataSourceFactoryProtocol = ChatDataSourceFactory()) {
        self.messagesRepository = messagesRepository
        self.dataSourceFactory = dataSourceFactory
        
        setupBinding()
    }
    
    private func setupBinding() {
        sendButtonDidTap
            .withLatestFrom(textFieldContent) { _, content in content }
            .flatMap { content -> Observable<String> in
                guard let content = content else { return .empty() }
                
                return .just(content)
            }
            .subscribe(onNext: { [messagesRepository] content in
                messagesRepository.add(Message(avater: .avatarMyself,
                                               username: Constants.username,
                                               timestamp: Date(),
                                               content: content))
            })
            .disposed(by: disposeBag)
    }
}

extension ChatViewModel: ChatViewModelProtocol {
    
    var dataSource: Observable<[SectionModel<String, ChatCell.Model>]> {
        Observable.combineLatest(refreshTrigger, messagesRepository.allMessage) { _, allMessages in allMessages }
            .map { [dataSourceFactory] messages in dataSourceFactory.make(with: messages) }
    }
}
