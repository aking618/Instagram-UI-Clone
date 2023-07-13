//
//  Comment.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/12/23.
//

struct Comment: Codable {
    let user: User
    let timestamp: String
    let message: String
}
