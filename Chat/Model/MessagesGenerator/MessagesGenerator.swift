//
//  MessagesGenerator.swift
//  Chat
//
//  Created by Paweł Bednorz on 25/06/2021.
//

import UIKit

struct MessagesGeneator {
    private enum Constants {
        static let messagesAmount = 50
        static let randomUsernames = [
            "Tom",
            "John",
            "Steve",
            "Christian",
            "English man",
            "The Lady",
            "SysAdmin"
        ]
        static let randomContent = [
            "Dude...",
            "Really?!",
            "Awesome",
            "Have you seen this video?",
            "IT'S CRUSHING!",
            "C'mon...",
            "What's up?"
        ]
    }
    
    /// Makes random avatar image.
    /// - Returns: On of two possible avatars.
    private func makeRandomAvatar() -> UIImage {
        if Bool.random() {
            return .avatarMyself
        } else {
            return .avatarFriend
        }
    }
    
    private func makeRandomContent() -> String {
        return randomContent(list: Constants.randomContent)
    }
    
    private func makeRandomUsername() -> String {
        return randomContent(list: Constants.randomUsernames)
    }
    
    private func randomContent(list: [String]) -> String {
        return list[Int.random(in: 0...list.count - 1)]
    }
}

extension MessagesGeneator: MessagesGeneratorProtocol {
    
    func generate() -> [Message] {
        return (1...Constants.messagesAmount)
            .reversed()
            .map { TimeInterval($0) }
            .map { element in
                Message(avater: makeRandomAvatar(),
                        username: makeRandomUsername(),
                        timestamp: Date().addingTimeInterval(-element),
                        content: makeRandomContent())
            }
            .sorted { $0.timestamp > $1.timestamp }
    }
    
}
