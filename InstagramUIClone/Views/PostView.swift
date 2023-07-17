//
//  PostView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/12/23.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State var showComments: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Image(post.user.profilePicURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .clipShape(Circle())

                Text(post.user.displayName)
                    .bold()

                Spacer()

                Image(systemName: "ellipsis")
            }

            Image(post.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400)
                .onTapGesture(count: 2) {
                    withAnimation {
                        post.isLiked.toggle()
                    }
                }

            HStack {
                Button {
                    post.isLiked.toggle()
                } label: {
                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                }
                Button(action: {
                    showComments = true
                }, label: { Image(systemName: "message") })
                Button(action: {}, label: { Image(systemName: "paperplane") })
                Spacer()
                Button(action: {}, label: { Image(systemName: "bookmark") })
            }
            .font(.title2)

            HStack(alignment: .top) {
                Text(post.user.displayName)
                    .font(.caption)
                    .bold()
                Text(post.caption)
                    .font(.caption2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .sheet(isPresented: $showComments) {
            CommentsListView(post: $post)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .init(id: "abc", user: .init(id: "", displayName: "AyrenKing", profilePicURL: "profileA"), imageURL: "postA", caption: "chilling", comments: [
            .init(user: .init(id: "asdfdsf", displayName: "OtherNameOfPerson", profilePicURL: "profileB"), timestamp: "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)", message: "That is so rad"),
            .init(user: .init(id: "asdfdsf", displayName: "OtherNameOfPerson", profilePicURL: "profileB"), timestamp: "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)", message: "That is so rad")
            
        ]),
                 showComments: true
        )
        .environmentObject(AppState())
    }
}
