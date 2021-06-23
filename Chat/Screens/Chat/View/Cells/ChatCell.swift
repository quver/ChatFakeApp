//
//  ChatCell.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import UIKit

final class ChatCell: UITableViewCell {
    struct Model {
        let avater: UIImage
        let username: String
        let relativeTime: String
        let message: String
    }
    
    static let cellIdentifier = "ChatCell"
    
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var relativeTimeLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    func configure(with model: Model) {
        avatarImage.image = model.avater
        nameLabel.text = model.username
        relativeTimeLabel.text = model.relativeTime
        messageLabel.text = model.message
    }
}

extension ChatCell.Model: Equatable {}
