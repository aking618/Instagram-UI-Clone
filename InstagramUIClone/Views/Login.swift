//
//  Login.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var appContext: AppState
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Instagram")
                .font(.title)
                .bold()
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.lightGray)
                .cornerRadius(5)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.lightGray)
                .cornerRadius(5)
            
            Button {
                guard !username.isEmpty, !password.isEmpty else {
                    return
                }
                
                // validate that the user is real through an api call
                print(username, password)
                
                // navigate to home
                appContext.navigate(route: Route.home)
                
            } label: {
                Text("Log in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(15.0)
            }
        }
        .padding()
    }
}

extension Color {
    static let lightGray: Color = .init(red: 240/255, green: 240/255, blue: 240/255)
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
