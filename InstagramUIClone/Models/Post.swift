//
//  Post.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/12/23.
//

struct Post: Codable {
    let id: String
    let user: User
    let imageURL: String
    let caption: String
    var comments: [Comment]
    var isLiked: Bool = false
}
