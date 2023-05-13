//
//  Model.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//

import Foundation
struct Model: Codable, Identifiable {
    let id: Int
    let make, model: String
    let price: Int
    let firstRegistration: String?
    let mileage: Int
    let fuel: String
    let images: [ImageList]?
    let description: String
    let modelline: String?
    let seller: Seller?
    let colour: String?
}

// MARK: - Image
struct ImageList: Codable {
    let url: String
}

// MARK: - Seller
struct Seller: Codable {
    let type, phone, city: String
}

typealias ModelElement = [Model]

