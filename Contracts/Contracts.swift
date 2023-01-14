//
//  Contracts.swift
//  Contracts
//
//  Created by Evgen on 13.01.2023.
//

import Foundation

public struct Response : Codable {
    public var users: [UserModel]
    
    private enum CodingKeys : String, CodingKey {
        case users = "results"
    }
}


public struct UserModel : Codable {
    var name: Name
    var location: Location
    var email: String
    public var picture: Picture
    
    public var fullName: String {
        get {
            return "\(name.first) \(name.last)"
        }
    }
    
    public var description: String {
        get {
            return "\(location.country) \(location.city)"
        }
    }
}


public struct Picture: Codable {
    public var thumbnail: String
}

public struct Name: Codable {
    var first: String
    var last: String
}

public struct Location: Codable {
    var country: String
    var city: String
}

/*
 
 {

   "name": {
     "title": "Miss",
     "first": "Jennie",
     "last": "Nichols"
   },
   "location": {
     "city": "Billings",
     "state": "Michigan",
     "country": "United States",
     "postcode": "63104",
   },
   "email": "jennie.nichols@example.com",


   "phone": "(272) 790-0888",
   "cell": "(489) 330-2385",
   "id": {
     "name": "SSN",
     "value": "405-88-3636"
   },
   "picture": {
     "large": "https://randomuser.me/api/portraits/men/75.jpg",
     "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
     "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
   },
   "nat": "US"
 }
 
 */

