//
//  ProfileImageView.swift
//  InstagramUIClone
//
//  Created by Ayren King on 7/16/23.
//

import SwiftUI

struct ProfileImageView: View {
    let imageURL: String
    let size: CGFloat
    
    var body: some View {
        Image(imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size)
            .clipShape(Circle())
    }
}
