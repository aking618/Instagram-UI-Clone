//
//  PostView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/12/23.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    
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
                Button{
                    post.isLiked.toggle()
                } label: {
                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                }
                Button(action: {}, label: { Image(systemName: "message") })
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
        }
        .padding()
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
