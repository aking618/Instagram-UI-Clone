//
//  Home.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Feed()
                .tabItem { Image(systemName: "house") }

            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }

            Text("Reels")
                .tabItem { Image(systemName: "play.square") }

            Text("Shop")
                .tabItem { Image(systemName: "bag") }

            Text("Profile")
                .tabItem { Image(systemName: "person.crop.circle") }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
