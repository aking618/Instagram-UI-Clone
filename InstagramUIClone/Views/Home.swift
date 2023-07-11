//
//  Home.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct Home: View {
    @State private var tab: Tab = .feed
    
    var body: some View {
        TabView(selection: $tab) {
            Feed()
                .tabItem { Image(systemName: "house") }
            
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass")}
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

enum Tab: Hashable {
    case feed
    case search
    case createPost
    case reels
    case profile
}
