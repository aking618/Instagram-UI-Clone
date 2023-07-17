//
//  AppState.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var rootView: Route = .login
    @Published var user: User = User(id: "abc", displayName: "AyrenKing", profilePicURL: "profileA")
}

enum Route {
    case login
    case home
}
