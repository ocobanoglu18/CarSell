//
//  RemoteImage.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//

import SwiftUI
struct RemoteImage: View {
    
    let item: Model
    let url: String
    
    var body: some View {
        if let imageUrl = item.images?.first?.url {
            RemoteImage(item: item, url: imageUrl)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 10)
        } else {
           Text("")
        }
    }
}
