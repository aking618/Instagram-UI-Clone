//
//  CommentsListView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/16/23.
//

import SwiftUI

struct CommentsListView: View {
    @EnvironmentObject var appState: AppState
    
    @Binding var post: Post
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 5)
                .cornerRadius(15)
                .padding()
            
            Text("Comments")
                .bold()
            
            Divider()
            
            List(post.comments, id: \.timestamp) { comment in
                HStack {
                    Image(comment.user.profilePicURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(comment.user.displayName)
                                .bold()
                                .font(.footnote)
                            
                            
                            Text("8h")
                        }
                        
                        Text(comment.message)
                    }
                }
                
            }
            .listStyle(.plain)
            
            HStack {
                Image(appState.user.profilePicURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 48)
                    .clipShape(Circle())
                    
                TextField("Add a comment for \(post.user.displayName)...", text: $text)
                    .padding()
                
                Button("Post") {
                    let comment = Comment(user: appState.user, timestamp: Date().description, message: text)
                    post.comments.append(comment)
                }
                .disabled(text.isEmpty)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
