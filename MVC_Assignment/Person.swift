//
//  Person.swift
//  MVC_Assignment
//
//  Created by Amit Kamat on 29/10/26.
//

import UIKit

class Person {
    var firstName: String
    var lastName: String
    var age: Int
    var city: String
    var height: Double
    var profileImages: [UIImage]
    var profileViewed: Bool

    init(
        firstName: String,
        lastName: String,
        age: Int,
        city: String,
        height: Double,
        profileImages: [UIImage],
        profileViewed: Bool = false
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.city = city
        self.height = height
        self.profileImages = profileImages
        self.profileViewed = profileViewed
    }
}
