//
//  Message.swift
//  Chat
//
//  Created by Paweł Bednorz on 24/06/2021.
//

import UIKit

struct Message {
    /// User's avatar image.
    let avater: UIImage
    
    /// User's name.
    let username: String
    
    /// Message timestamp.
    let timestamp: Date
    
    /// Message content.
    let content: String
}
