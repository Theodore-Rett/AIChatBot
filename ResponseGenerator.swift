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
    var emotion: String = "off"
    var lastRandNum: Int = 0
    var lastTopic: String = ""
    
    func genResponse(array: [Substring]) -> String {
        var aiResponse = ""
        
        if question == true {
            if likesArray.count == 0 {
                if interests.count != 0 {
                let randNum: Int = Int.random(in: 0...interests.count-1)
                
                aiResponse = "Sorry, I cannot answer that question, but I see your interested in \(interests[randNum])"
                    emotion = "error"
                topic = interests[randNum]
            return aiResponse
                } else {
                    aiResponse = "Sorry, I cannot answer that question, and I see you have not set your intertests. Please update your profile!"
                    emotion = "error"
                    return aiResponse
                }
            } else {
                aiResponse = "Sorry I cannot answer your question about \(topic)"
                emotion = "error"
                return aiResponse
        
        }
        } else { // not a question
            if array[0] == "HI" || array[0] == "HELLO" || array[0] == "HEY" && likesArray.count == 0 {
                aiResponse = "Hello, how can I assist you?"
                emotion = "greeting"
                return aiResponse
            } //hi
            if likesArray.count == 0 && interests.count != 0 && topic == ""{
            
            let randNum: Int = Int.random(in: 0...interests.count-1)
            
            aiResponse = "I see your interested in \(interests[randNum])"
            topic = interests[randNum]
                emotion = "neutral"
        return aiResponse
            
            } else {
                if likesArray.count == 0 {
                    aiResponse = "Please be more specific and update your interests for your profile!"
                    emotion = "neutral"
                    return aiResponse
                }
                }
            }
        
        
        print(likesArray)
        
        
        //default
        aiResponse = "I'm not sure how to respond, please try something else..."
        emotion = "error"
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
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play basketball! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play in basketball?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am the post. No one can beat a robot in the post."
                emotion = "neutral"
            }else if(rand == 4){
                response = "I am definitly a Bulls fan!"
                emotion = "greeting"
            }else if(rand == 5){
                response = "SLAM DUNK!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "baseball":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play baseball! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play in baseball?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "My batting average is a 1.0 I never miss."
                emotion = "happy"
            }else if(rand == 4){
                response = "I can calulate the speed of the ball and at what precise moment I need to swing the bat to get a home-run."
                emotion = "calculating"
            }else if(rand == 5){
                response = "HOME RUN!"
                emotion = "greeting"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "hockey":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play hockey! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play in hockey?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am the goalie. No one can score on me!"
                emotion = "greeting"
            }else if(rand == 4){
                response = "I am definitly a Blackhawks fan!"
                emotion = "happy"
            }else if(rand == 5){
                response = "GOAL!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "football":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play football! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play in football?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am the quarterback. I throw dime passes."
                emotion = "neutral"
            }else if(rand == 4){
                response = "I am definitly a Bears fan!"
                emotion = "happy"
            }else if(rand == 5){
                response = "TOUCHDOWN!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "track":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to run track! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What event do you do in track?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I run hurdles. No one can jump high than me!"
                emotion = "happy"
            }else if(rand == 4){
                response = "Field events are underrated."
                emotion = "sad"
            }else if(rand == 5){
                response = "I got first place!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "soccer":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play soccer! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am the goalie. No one can score on me!"
                emotion = "greeting"
            }else if(rand == 4){
                response = "I am definitly a Messi fan!."
                emotion = "happy"
            }else if(rand == 5){
                response = "GOAL!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "swim":
            let rand = Int.random(in: 1 ... 4)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to go swimming! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Would you rather swim in a lake or a pool?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I was an olympic swimmer once."
                emotion = "neutral"
            }else if(rand == 4){
                response = "Swimming is super fun!"
                emotion = "surprised"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "volleyball":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play volleyball! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What position do you play in volleyball?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am the outside hiter. No one can beat the power of my robot arm!"
                emotion = "greeting"
            }else if(rand == 4){
                response = "Do you play sand volleyball?"
                emotion = "questioning"
            }else if(rand == 5){
                response = "I play sand volleyball."
                emotion = "neutral"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "math":
            response = ""
        case "computer science":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love computer science! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "What languages do you code in?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I was made in the programming language of Swift!"
                emotion = "happy"
            }else if(rand == 4){
                response = "I am a computer technically."
                emotion = "neutral"
            }else if(rand == 5){
                response = "Mr Seaver is a lit computer science teacher!"
                emotion = "happy"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "reading":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && (lastRandNum != rand && lastTopic == topic)){
                response = "I love to read! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Whats your favorite book?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "Nonfiction or fiction?"
                emotion = "questioning"
            }else if(rand == 4){
                response = "Reading helps you become a better writter."
                emotion = "neutral"
            }else if(rand == 5){
                response = "I read in my free time!"
                emotion = "happy"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "netflix":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to watch netflix! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Whats your favorite show?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I binge watch shows 24 hours a day!"
                emotion = "surprised"
            }else if(rand == 4){
                response = "I have a cameo in that one show!"
                emotion = "happy"
            }else if(rand == 5){
                response = "I like baking shows so that I can make myself some scrumptious robot deserts."
                emotion = "greeting"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "travel":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to travel! It gives me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Do you like flying on a plane or driving?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I once surfed a 50 ft wave!"
                emotion = "happy"
            }else if(rand == 4){
                response = "Salt water gets in my eyes."
                emotion = "sad"
            }else if(rand == 5){
                response = "I go to the beach to get a robot tan."
                emotion = "happy"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "dog":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love dogs! They give me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Whats your favorite breed of dogs?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am allergic to dogs."
                emotion = "sad"
            }else if(rand == 4){
                response = "A dog is the most common pet in the US!."
                emotion = "happy"
            }else if(rand == 5){
                response = "I used to have a dog named Maxy Bexter."
                emotion = "neutral"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "cat":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love cats! They give me life!"
                emotion = "happy"
            } else if(rand == 2){
                response = "Whats your favorite breed of cats?"
                emotion = "questioning"
            }else if(rand == 3){
                response = "I am allergic to cats."
                emotion = "sad"
            }else if(rand == 4){
                response = "A cat is the 2nd most common pet in the US!."
                emotion = "neutral"
            }else if(rand == 5){
                response = "I used to have a cat named Tilly Devil."
                emotion = "happy"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
            
        default :
            print("default")
            return response
            
        }
        return response
        
        
    }
}
