//
//  Profile.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/12/22.
//

import Foundation

class Profile {
    
    var basketball: Bool = false //default is false, they don't like it
    var volleyball: Bool = false
    var football: Bool = false
    var hockey: Bool = false
    var swim: Bool = false
    var baseball: Bool = false
    var soccer: Bool = false
    var track: Bool = false
    var math: Bool = false
    var reading: Bool = false
    var netflix: Bool = false
    var computers: Bool = false
    var cat: Bool = false
    var dog: Bool = false
    var beach: Bool = false

    
    init(bkb: Bool, vb: Bool, fb: Bool, hcy: Bool, swim: Bool, baseb: Bool, soc: Bool, track: Bool, math: Bool, read: Bool, net: Bool, comp: Bool, cat: Bool, dog: Bool, beach: Bool) {
        
        basketball = bkb
        volleyball = vb
        football = fb
        hockey = hcy
        self.swim = swim
        soccer = soc
        self.track = track
        self.math = math
        reading = read
        netflix = net
        computers = comp
        self.cat = cat
        self.dog = dog
        self.beach = beach
        
        
    }
    
    
    init() {
        //default initalizer
    }
    
    
}
