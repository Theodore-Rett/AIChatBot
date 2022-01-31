//
//  ResponseGenerator.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/19/22.
//

import Foundation

class ResponseGenerator {
    
    var likesArray: [[String]] = []
    
    var interests: [String] = [] //array of interests from the profile screen
    
    var topic: String = ""
    var question: Bool = false
    var excited: Bool = false
    
    func genResponse(array: [Substring]) -> String {
        var aiResponse = ""
        
        if question == true {
            if likesArray.count == 0 {
                if interests.count != 0 {
                let randNum: Int = Int.random(in: 0...interests.count-1)
                
                aiResponse = "Sorry, I cannot answer that question, but I see your interested in \(interests[randNum])"
                topic = interests[randNum]
            return aiResponse
                } else {
                    aiResponse = "Sorry, I cannot answer that question, and I see you have not set your intertests. Please update your profile!"
                    return aiResponse
                }
            } else {
                aiResponse = "Sorry I cannot answer your question about \(topic)"
                return aiResponse
        
        }
        } else { // not a question
            if array[0] == "HI" || array[0] == "HELLO" || array[0] == "HEY" && likesArray.count == 0 {
                aiResponse = "Hello, how can I assist you?"
                return aiResponse
            } //hi
            if likesArray.count == 0 && interests.count != 0 && topic == ""{
            
            let randNum: Int = Int.random(in: 0...interests.count-1)
            
            aiResponse = "I see your interested in \(interests[randNum])"
            topic = interests[randNum]
        return aiResponse
            
            } else {
                if likesArray.count == 0 {
                    aiResponse = "Please be more specific and update your interests for your profile!"
                    return aiResponse
                } else if(topic == "computer science"){
                    let rand = Int.random(in: 1 ... 10)
                    if(rand == 1){
                        aiResponse = "I love computer science! It gives me life!"
                    } else if(rand == 2){
                        aiResponse = "What languages do you code in?"
                    }
                    return aiResponse
                }
            }
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
    
    
    
    func randTopicResponse(topic: String) -> String {
        var response = ""
        
        switch topic {
            
        case "basketball":
            response = ""
        case "baseball":
            response = ""
        case "hockey":
            response = ""
        case "football":
            response = ""
        case "track":
            response = ""
        case "hockey":
            response = ""
        case "soccer":
            response = ""
        case "swim":
            response = ""
        case "volleyball":
            response = ""
        case "math":
            response = ""
        case "computer science":
            response = ""
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1){
                response = "I love computer science! It gives me life!"
            } else if(rand == 2){
                response = "What languages do you code in?"
            } else if(rand == 3){
                response = "Computer Science?!? THAT'S LIT!"
            } else if(rand == 4){
                response = "I see you like computer science, what's your favorite project to work on?"
            } else if(rand == 5){
                response = "01000011 01101111 01101101 01110000 01110101 01110100 01100101 01110010 00100000 01110011 01100011 01101001 01100101 01101110 01100011 01100101 00100000 01101001 01110011 00100000 01110100 01101000 01100101 00100000 01100010 01100101 01110011 01110100 00100001"
            }
        case "reading":
            response = ""
        case "netflix":
            response = ""
        case "beach":
            response = ""
        case "dog":
            response = ""
        case "cat":
            response = ""
            
        default :
            print("default")
        }
            return response
    }
}
