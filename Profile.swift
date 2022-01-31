//
//  Profile.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/12/22.
//

import Foundation

class Profile {
    
    var name: String = ""
    
    var basketball: Bool = false //default is false, they don't like it
    var baseball: Bool = false
    var hockey: Bool = false
    var football: Bool = false
    var track: Bool = false
    var soccer: Bool = false
    var swim: Bool = false
    var volleyball: Bool = false
    var math: Bool = false
    var computers: Bool = false
    var reading: Bool = false
    var netflix: Bool = false
    var beach: Bool = false
    var dog: Bool = false
    var cat: Bool = false
    
    var likes = Array(repeating: false, count: 15) //parallel arrays \/
    var catagories: [String] = ["basketball", "baseball", "hockey", "hockey", "football", "track", "soccer", "swim", "volleyball", "math", "computer science", "reading", "netflix", "beach", "dogs", "cats"]

    
    
    
    
    func toString() {
        print(basketball)
        print(baseball)
        print(hockey)
        print(football)
        print(track)
        print(soccer)
        print(swim)
        print(volleyball)
        print(math)
        print(computers)
        print(reading)
        print(netflix)
        print(beach)
        print(dog)
        print(cat)
    }
    
    
    init() {
        //default initalizer
    }
    
    
}
