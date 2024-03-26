//
//  Appetizer.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

//import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is a description for my app",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)

    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]

    static let sampleAppetizer1 = Appetizer(id: 0001,
                                           name: "Test Appetizer 1",
                                           description: "This is a description for my app",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let sampleAppetizer2 = Appetizer(id: 0002,
                                           name: "Test Appetizer 2",
                                           description: "This is a description for my app",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let sampleAppetizer3 = Appetizer(id: 0003,
                                           name: "Test Appetizer 3",
                                           description: "This is a description for my app",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)

    static let orderItems = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
