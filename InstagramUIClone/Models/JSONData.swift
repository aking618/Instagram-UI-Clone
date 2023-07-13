//
//  JSONData.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/12/23.
//

// DEMO PURPOSES ONLY
let jsonString = """
[
  {
    "id": "64af009967b8e6980b8e6870",
    "user": {
      "id": "64af0099870ebeaa6d2f01c3",
      "displayName": "LesaMarquez",
      "profilePicURL": "profileA"
    },
    "imageURL": "postA",
    "caption": "aliqua minim id cillum magna eu ex aute mollit quis tempor qui tempor incididunt est anim incididunt sint incididunt",
    "comments": [
      {
        "user": {
          "id": "64af009970e76eb7b002c5e8",
          "displayName": "DejesusMcconnell",
          "profilePicURL": "profileB"
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
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "adipisicing id magna et aliqua ullamco consectetur irure incididunt qui consectetur in eu laboris duis tempor ad aliquip fugiat"
      },
      {
        "user": {
          "id": "64af0099c415d26ca952779d",
          "displayName": "ClaudiaCabrera",
          "profilePicURL": "profileE"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "sit labore magna esse voluptate pariatur laboris sint ut et excepteur"
      },
      {
        "user": {
          "id": "64af00990190aed3b158185e",
          "displayName": "JenningsMorrison",
          "profilePicURL": "profileF"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "nostrud sint culpa reprehenderit aliqua consectetur"
      },
      {
        "user": {
          "id": "64af0099ec47812d8e6796c1",
          "displayName": "KaufmanBender",
          "profilePicURL": "profileG"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "do mollit consectetur anim magna consequat incididunt irure consectetur ex fugiat velit"
      },
      {
        "user": {
          "id": "64af0099e4c2cb511fa856f1",
          "displayName": "CottonRasmussen",
          "profilePicURL": "profileH"
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
      "id": "64af0099aea26cd8b3c72431",
      "displayName": "LetaBarrera",
      "profilePicURL": "profileD"
    },
    "imageURL": "postD",
    "caption": "anim ex sunt culpa irure fugiat nisi ea nisi laborum ad aliquip occaecat id duis sit",
    "comments": [],
    "isLiked": true
  },
  {
    "id": "64af0099a18ebd87fe0c1bf2",
    "user": {
      "id": "64af0099c415d26ca952779d",
      "displayName": "ClaudiaCabrera",
      "profilePicURL": "profileE"
    },
    "imageURL": "postC",
    "caption": "officia sint reprehenderit mollit ullamco consectetur fugiat nostrud laborum labore culpa duis mollit est officia",
    "comments": [
      {
        "user": {
          "id": "64af0099aea26cd8b3c72431",
          "displayName": "LetaBarrera",
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "non nisi occaecat veniam velit nostrud incididunt et quis ullamco nulla ea aute non"
      },
      {
        "user": {
          "id": "64af0099aea26cd8b3c72431",
          "displayName": "LetaBarrera",
          "profilePicURL": "profileD"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "non est"
      },
      {
        "user": {
          "id": "64af0099870ebeaa6d2f01c3",
          "displayName": "LesaMarquez",
          "profilePicURL": "profileA"
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
      "id": "64af00990190aed3b158185e",
      "displayName": "JenningsMorrison",
      "profilePicURL": "profileF"
    },
    "imageURL": "postF",
    "caption": "ipsum culpa amet do nostrud id mollit ullamco reprehenderit cillum mollit",
    "comments": [],
    "isLiked": false
  },
  {
    "id": "64af0099f0dfbbf2bf9a163d",
    "user": {
      "id": "64af0099ec47812d8e6796c1",
      "displayName": "KaufmanBender",
      "profilePicURL": "profileG"
    },
    "imageURL": "postG",
    "caption": "pariatur eiusmod nostrud enim velit culpa commodo",
    "comments": [
      {
        "user": {
          "id": "64af0099e4c2cb511fa856f1",
          "displayName": "CottonRasmussen",
          "profilePicURL": "profileH"
        },
        "timestamp": "Wed Jul 12 2023 14:35:53 GMT-0500 (Central Daylight Time)",
        "message": "dolor commodo amet commodo ad dolore eiusmod enim proident esse dolore magna ullamco ipsum dolore adipisicing est"
      }
    ],
    "isLiked": false
  },
  {
    "id": "64af0099e0951de614ac24ff",
    "user": {
      "id": "64af0099e4c2cb511fa856f1",
      "displayName": "CottonRasmussen",
      "profilePicURL": "profileH"
    },
    "imageURL": "postH",
    "caption": "cillum nisi mollit esse ex ex cupidatat laboris officia cillum esse officia non ea commodo",
    "comments": [],
    "isLiked": true
  }
]
"""

