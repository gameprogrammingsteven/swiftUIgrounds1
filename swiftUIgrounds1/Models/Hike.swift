//
//  Hike.swift
//  swiftUIgrounds1
//
//  Created by Stephen Johnson on 10/31/22.
//

import Foundation

struct Hike {
    let name: String
    let imageURL: String
    let miles: Double
    
    func getURL() -> URL {
        return URL(string: imageURL) ?? URL(string: "https://www.yahoo.com")!
    }
}

extension Hike {
    static func testInfo() -> [Hike] {
        return [
            Hike(name: "Thing", imageURL: "s", miles: 2.7),
            Hike(name: "Thing1", imageURL: "a", miles: 2.7),
            Hike(name: "Thing2", imageURL: "l", miles: 2.7)

        ]
    }
}
