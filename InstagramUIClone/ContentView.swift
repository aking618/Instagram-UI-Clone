//
//  ContentView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appContext = AppState()
    
    var body: some View {
        NavigationStack(path: $appContext.path) {
            Login()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        Home()
                    }
                }
        }
        .environmentObject(appContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
