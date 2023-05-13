//
//  SellerApp.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//

import SwiftUI

struct CustomColor {
    static let MainColor = Color("MainColor")
    static let CardColor = Color("CardColor")
}

@main
struct SellerApp: App {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "MainColor")
                                   
     }

    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.dark)
        }
    }
}
