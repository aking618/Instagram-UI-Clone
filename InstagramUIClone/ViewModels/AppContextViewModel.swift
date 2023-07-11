//
//  AppContextViewModel.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

class AppContextViewModel: ObservableObject {
    @Published var path = NavigationPath()
        
    func navigate(route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
}

enum Route: Hashable {
    case home
}
