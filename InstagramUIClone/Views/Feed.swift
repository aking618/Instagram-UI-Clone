//
//  Feed.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/10/23.
//

import SwiftUI

struct Feed: View {
    @State var posts: [Post] = []

    var body: some View {
        NavigationStack {
            
            if posts.isEmpty {
                ProgressView {
                    Text("Currently zero posts...")
                }
            }
            
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(posts, id: \.id) { post in
                            VStack {
                                Image(post.imageURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                Text(post.user.displayName)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .frame(width: 64)
                        }
                    }
                }
                .scrollIndicators(.hidden)

                ScrollView {
                    ForEach(posts, id: \.id) { post in
                        PostView(post: post)
                    }
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Instagram")
                            .font(.title2)
                            .bold()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {}, label: { Image(systemName: "plus.square") })
                            Button(action: {}, label: { Image(systemName: "heart") })
                            Button(action: {}, label: { Image(systemName: "ellipsis.message") })
                        }
                    }
                }
            }
            .task {
                let jsonData = Data(jsonString.utf8)
                let decoder = JSONDecoder()
                do {
                    try await Task.sleep(for: .milliseconds(500))
                    let posts = try decoder.decode([Post].self, from: jsonData)
                    await MainActor.run {
                        self.posts = posts
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
