//
//  ResponseGenerator.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/19/22.
//

import Foundation

class ResponseGenerator {
    
    var likesArray: [[String]] = []
    
    var interests: [String] = []
    
    var topic: String = ""
    
    func genResponse(array: [Substring]) -> String {
        var aiResponse = ""
        
        
    if array.count == 1 {
            if array[0] == "HI" || array[0] == "HELLO" || array[0] == "HEY" {
                aiResponse = "Hello, how can I assist you?"
                return aiResponse
            }
        if likesArray.count == 0 {
            aiResponse = "Please be more specific!"
            return aiResponse
        }
    } else if likesArray.count == 0 {
            
            let randNum: Int = Int.random(in: 0...interests.count-1)
            
            aiResponse = "I see your interested in \(interests[randNum])"
            topic = interests[randNum]
        return aiResponse
            
        }
        
        print(likesArray)
        
        
        //default
        aiResponse = "I'm not sure how to respond, please try something else..."
        return aiResponse
    }
    
    init() {
        
        var i = 0
        for each in UserDefaults.standard.array(forKey: "likes") as! [Bool] {
            if each == true {
                interests.append(UIViewController2.profile.catagories[i])
            }
            i += 1
        }
    }
    
    func resetLikes() {
        var i = 0
        for each in UserDefaults.standard.array(forKey: "likes") as! [Bool] {
            if each == true {
                interests.append(UIViewController2.profile.catagories[i])
            }
            i += 1
        }
    }
    
    func mostOccuring() -> String{
        let mappedLikes = likesArray.map {($0,1)}
        
        let counts = Dictionary(mappedLikes, uniquingKeysWith: +)
        
        var mostCommon = likesArray(1)
        
        var i = 0
        
        while i < likesArray.count{
            
            if(counts)
            
            i+=
        }
        
        
        return "temp"
    }
    
}
