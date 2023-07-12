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
            ScrollView {
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
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
            .toolbar(.visible)
        }
        .task {
            let jsonData = Data(jsonString.utf8)
            let decoder = JSONDecoder()
            do {
//                try await Task.sleep(for: .milliseconds(500))
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

struct PostView: View {
    @State var post: Post
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
//                Image(post.user.profilePicURL)
//                    .clipShape(Circle())
                Circle()
                    .frame(width: 32)
                
                Text(post.user.displayName)
                    .bold()
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            
//            Image(post.imageURL)
            Rectangle()
                .frame(height: 400)
            
            HStack {
                Button(action: {}, label: { Image(systemName: "heart") })
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

struct Post: Codable {
    let id: String
    let user: User
    let imageURL: String
    let caption: String
    var comments: [Comment]
    var isLiked: Bool = false
}

struct User: Codable {
    let id: String
    let displayName: String
    let profilePicURL: String
}

struct Comment: Codable {
    let user: User
    let timestamp: String
    let message: String
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Home()
        }
    }
}

let jsonString = """
[
  {
    "id": "64af009967b8e6980b8e6870",
    "user": {
      "id": "64af0099870ebeaa6d2f01c3",
      "displayName": "LesaMarquez",
      "profilePicURL": "profileH"
    },
    "imageURL": "postG",
    "caption": "aliqua minim id cillum magna eu ex aute mollit quis tempor qui tempor incididunt est anim incididunt sint incididunt",
    "comments": [
      {
        "user": {
          "id": "64af009970e76eb7b002c5e8",
          "displayName": "DejesusMcconnell",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "irure exercitation duis"
      },
      {
        "user": {
          "id": "64af0099cd9ff69055e63e7e",
          "displayName": "ReneMiranda",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "aute culpa sit sit reprehenderit irure mollit"
      },
      {
        "user": {
          "id": "64af0099aea26cd8b3c72431",
          "displayName": "LetaBarrera",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "adipisicing id magna et aliqua ullamco consectetur irure incididunt qui consectetur in eu laboris duis tempor ad aliquip fugiat"
      },
      {
        "user": {
          "id": "64af0099c415d26ca952779d",
          "displayName": "ClaudiaCabrera",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "sit labore magna esse voluptate pariatur laboris sint ut et excepteur"
      },
      {
        "user": {
          "id": "64af00990190aed3b158185e",
          "displayName": "JenningsMorrison",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "nostrud sint culpa reprehenderit aliqua consectetur"
      },
      {
        "user": {
          "id": "64af0099ec47812d8e6796c1",
          "displayName": "KaufmanBender",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "do mollit consectetur anim magna consequat incididunt irure consectetur ex fugiat velit"
      },
      {
        "user": {
          "id": "64af0099e4c2cb511fa856f1",
          "displayName": "CottonRasmussen",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "sint enim sunt cillum pariatur consectetur irure excepteur"
      }
    ],
    "isLiked": false
  },
  {
    "id": "64af0099ffb618b1bd0dc3e6",
    "user": {
      "id": "64af0099b1a6fc20093f9836",
      "displayName": "FannieElliott",
      "profilePicURL": "profileA"
    },
    "imageURL": "postC",
    "caption": "anim ex sunt culpa irure fugiat nisi ea nisi laborum ad aliquip occaecat id duis sit",
    "comments": [
      {
        "user": {
          "id": "64af0099378808a0d2cb7048",
          "displayName": "AustinHooper",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "proident"
      },
      {
        "user": {
          "id": "64af0099832fdc4f25353206",
          "displayName": "MaryellenLee",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "consequat sit sint elit duis aliqua eiusmod est laboris sunt enim"
      },
      {
        "user": {
          "id": "64af0099037254e624228b09",
          "displayName": "ParkerGonzalez",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "velit ullamco"
      },
      {
        "user": {
          "id": "64af0099122107f0d134967d",
          "displayName": "CannonJohnson",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "Lorem nostrud incididunt proident aliquip non et non ipsum fugiat irure irure amet esse elit Lorem eiusmod cillum id"
      },
      {
        "user": {
          "id": "64af0099c0f63ec573a8b4c2",
          "displayName": "WatkinsRichmond",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "voluptate enim excepteur tempor est excepteur irure Lorem aliqua id labore"
      },
      {
        "user": {
          "id": "64af00996c56a85c487857cc",
          "displayName": "VangAndrews",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "consectetur"
      },
      {
        "user": {
          "id": "64af0099a5e8ac81b79d0c59",
          "displayName": "CarissaEnglish",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "culpa sint est fugiat in elit id eu"
      }
    ],
    "isLiked": true
  },
  {
    "id": "64af0099a18ebd87fe0c1bf2",
    "user": {
      "id": "64af00991351b63c638a5824",
      "displayName": "MaggieBowen",
      "profilePicURL": "profileC"
    },
    "imageURL": "postH",
    "caption": "officia sint reprehenderit mollit ullamco consectetur fugiat nostrud laborum labore culpa duis mollit est officia",
    "comments": [
      {
        "user": {
          "id": "64af0099bed3b2a17f750e70",
          "displayName": "HilaryBowman",
          "profilePicURL": "profileG"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "non nisi occaecat veniam velit nostrud incididunt et quis ullamco nulla ea aute non"
      },
      {
        "user": {
          "id": "64af0099213012deefb20688",
          "displayName": "CarmenBall",
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "non est"
      },
      {
        "user": {
          "id": "64af0099ef4caca51e19825c",
          "displayName": "HesterSanders",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "in dolore velit consequat proident cupidatat minim ex adipisicing exercitation mollit laboris eiusmod excepteur anim"
      },
      {
        "user": {
          "id": "64af00993fc20d3f542c2cf1",
          "displayName": "MarianneDavenport",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "ullamco incididunt eiusmod"
      },
      {
        "user": {
          "id": "64af00990c8077fb06f7b241",
          "displayName": "SusieBruce",
          "profilePicURL": "profileF"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "laborum veniam nostrud fugiat commodo voluptate excepteur eu esse"
      },
      {
        "user": {
          "id": "64af0099bcd4ad6c901095b7",
          "displayName": "LanaHensley",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "dolor ullamco qui excepteur laboris enim consequat nostrud"
      },
      {
        "user": {
          "id": "64af0099ba9c78b02c56284a",
          "displayName": "KathrineTerry",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "dolor commodo amet commodo ad dolore eiusmod enim proident esse dolore magna ullamco ipsum dolore adipisicing est"
      }
    ],
    "isLiked": true
  },
  {
    "id": "64af0099ae6d053ed8e6b1de",
    "user": {
      "id": "64af009959e8a7a13bc0ca7e",
      "displayName": "StevensonPope",
      "profilePicURL": "profileD"
    },
    "imageURL": "postF",
    "caption": "ipsum culpa amet do nostrud id mollit ullamco reprehenderit cillum mollit",
    "comments": [
      {
        "user": {
          "id": "64af0099341222affa8b4ddc",
          "displayName": "SchmidtStrickland",
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "culpa ad nisi"
      },
      {
        "user": {
          "id": "64af0099b6308f9f884d30d9",
          "displayName": "JoannSingleton",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "sint"
      },
      {
        "user": {
          "id": "64af0099dd897461a905b627",
          "displayName": "IsabelleCochran",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "ea aute non elit ea deserunt"
      },
      {
        "user": {
          "id": "64af00991d2c9f0971b72f43",
          "displayName": "LaurelMedina",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "aliquip ipsum est commodo nulla do in enim enim duis sunt"
      },
      {
        "user": {
          "id": "64af0099d800830730905a89",
          "displayName": "GayDonovan",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "elit nulla consequat velit ea cupidatat nulla in qui quis consequat qui consectetur cillum ipsum non amet"
      },
      {
        "user": {
          "id": "64af0099558d9b84582848ff",
          "displayName": "CaldwellRamos",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "mollit ad quis eiusmod laborum enim minim est"
      },
      {
        "user": {
          "id": "64af0099bb8b7413381a2f21",
          "displayName": "SheliaDunn",
          "profilePicURL": "profileF"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "officia ex dolore sunt qui proident esse ad proident"
      }
    ],
    "isLiked": false
  },
  {
    "id": "64af0099f0dfbbf2bf9a163d",
    "user": {
      "id": "64af0099e3ea7a0eb15f3716",
      "displayName": "GladysWilson",
      "profilePicURL": "profileG"
    },
    "imageURL": "postD",
    "caption": "pariatur eiusmod nostrud enim velit culpa commodo",
    "comments": [
      {
        "user": {
          "id": "64af009903d58d165c9c6f85",
          "displayName": "SnyderKoch",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "proident labore sit cupidatat minim pariatur eu velit"
      },
      {
        "user": {
          "id": "64af0099cc9a19487aff7351",
          "displayName": "AtkinsonOneal",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "consectetur"
      },
      {
        "user": {
          "id": "64af0099dd5288539c6eb44a",
          "displayName": "BurrisFisher",
          "profilePicURL": "profileA"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "quis nisi adipisicing proident nulla nisi ut dolor ea labore exercitation"
      },
      {
        "user": {
          "id": "64af009909f364d1d6e8df3b",
          "displayName": "PayneFry",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "exercitation Lorem sit"
      },
      {
        "user": {
          "id": "64af00992d69992cd9ae221d",
          "displayName": "LaurieLambert",
          "profilePicURL": "profileF"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "commodo excepteur sit irure aute cupidatat eiusmod nisi cupidatat veniam sunt anim enim cillum in dolor"
      },
      {
        "user": {
          "id": "64af009976e72e957a316313",
          "displayName": "AshleeWashington",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "deserunt nisi cillum"
      },
      {
        "user": {
          "id": "64af0099a38477200b043ed9",
          "displayName": "MaryannePhelps",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "deserunt"
      }
    ],
    "isLiked": false
  },
  {
    "id": "64af0099e0951de614ac24ff",
    "user": {
      "id": "64af00992ad41b7eab4a0dab",
      "displayName": "CrawfordBenson",
      "profilePicURL": "profileH"
    },
    "imageURL": "postC",
    "caption": "cillum nisi mollit esse ex ex cupidatat laboris officia cillum esse officia non ea commodo",
    "comments": [
      {
        "user": {
          "id": "64af00998ca69e1c00a8f627",
          "displayName": "SimonAguirre",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "pariatur incididunt tempor deserunt magna laborum tempor nostrud"
      },
      {
        "user": {
          "id": "64af0099d2bceb3a1cdd3629",
          "displayName": "JenkinsBurris",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "quis nostrud aute sunt nulla pariatur velit aliqua enim in ipsum pariatur incididunt eiusmod"
      },
      {
        "user": {
          "id": "64af00990fa56ac4580481cf",
          "displayName": "ShepardPatterson",
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "esse esse anim ipsum nulla cupidatat cupidatat adipisicing et reprehenderit do"
      },
      {
        "user": {
          "id": "64af0099d9f159a53ba4b23f",
          "displayName": "HarrietBauer",
          "profilePicURL": "profileF"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "dolore nisi nostrud reprehenderit pariatur sunt sint aliquip"
      },
      {
        "user": {
          "id": "64af00993b294435aa1ed0d4",
          "displayName": "BernardJoseph",
          "profilePicURL": "profileC"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "commodo veniam est irure veniam duis aute do eu consequat et eiusmod incididunt enim eiusmod et occaecat laboris"
      },
      {
        "user": {
          "id": "64af0099ce032c174ccb1b2b",
          "displayName": "LuzMercado",
          "profilePicURL": "profileB"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "velit anim laborum cupidatat laboris laboris qui nisi exercitation est adipisicing excepteur sunt tempor"
      },
      {
        "user": {
          "id": "64af0099e5f3be1dfcefab1b",
          "displayName": "KayRivers",
          "profilePicURL": "profileG"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "adipisicing sunt irure amet aliqua est est nisi sit aliquip"
      }
    ],
    "isLiked": true
  }
]
"""
