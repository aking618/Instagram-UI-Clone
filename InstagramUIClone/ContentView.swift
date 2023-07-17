//
//  ContentView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()

    var body: some View {
        Group {
            switch appState.rootView {
            case .login:
                Login()
                    .transition(.move(edge: .leading))
                    .environmentObject(appState)
            case .home:
                Home()
                    .transition(.move(edge: .trailing))
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.rootView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
