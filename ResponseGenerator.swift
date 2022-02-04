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
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play basketball! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play in basketball?"
            }else if(rand == 3){
                response = "I am the post. No one can beat a robot in the post."
            }else if(rand == 4){
                response = "I am definitly a Bulls fan!"
            }else if(rand == 5){
                response = "SLAM DUNK!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "baseball":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play baseball! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play in baseball?"
            }else if(rand == 3){
                response = "My batting average is a 1.0 I never miss."
            }else if(rand == 4){
                response = "I can calulate the speed of the ball and at what precise moment I need to swing the bat to get a home-run."
            }else if(rand == 5){
                response = "HOME RUN!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "hockey":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play hockey! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play in hockey?"
            }else if(rand == 3){
                response = "I am the goalie. No one can score on me!"
            }else if(rand == 4){
                response = "I am definitly a Blackhawks fan!"
            }else if(rand == 5){
                response = "GOAL!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "football":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play football! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play in football?"
            }else if(rand == 3){
                response = "I am the quarterback. I throw dime passes."
            }else if(rand == 4){
                response = "I am definitly a Bears fan!"
            }else if(rand == 5){
                response = "TOUCHDOWN!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "track":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to run track! It gives me life!"
            } else if(rand == 2){
                response = "What event do you do in track?"
            }else if(rand == 3){
                response = "I run hurdles. No one can jump high than me!"
            }else if(rand == 4){
                response = "Field events are underrated."
            }else if(rand == 5){
                response = "I got first place!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "soccer":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play soccer! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play?"
            }else if(rand == 3){
                response = "I am the goalie. No one can score on me!"
            }else if(rand == 4){
                response = "I am definitly a Messi fan!."
            }else if(rand == 5){
                response = "GOAL!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "swim":
            let rand = Int.random(in: 1 ... 4)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to go swimming! It gives me life!"
            } else if(rand == 2){
                response = "Would you rather swim in a lake or a pool?"
            }else if(rand == 3){
                response = "I was an olympic swimmer once."
            }else if(rand == 4){
                response = "Swimming is super fun!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "volleyball":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to play volleyball! It gives me life!"
            } else if(rand == 2){
                response = "What position do you play in volleyball?"
            }else if(rand == 3){
                response = "I am the outside hiter. No one can beat the power of my robot arm!"
            }else if(rand == 4){
                response = "Do you play sand volleyball?"
            }else if(rand == 5){
                response = "I play sand volleyball."
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
            } else if(rand == 2){
                response = "What languages do you code in?"
            }else if(rand == 3){
                response = "I was made in the programming language of Swift!"
            }else if(rand == 4){
                response = "I am a computer technically."
            }else if(rand == 5){
                response = "Mr Seaver is a lit computer science teacher!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "reading":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && (lastRandNum != rand && lastTopic == topic)){
                response = "I love to read! It gives me life!"
            } else if(rand == 2){
                response = "Whats your favorite book?"
            }else if(rand == 3){
                response = "Nonfiction or fiction?"
            }else if(rand == 4){
                response = "Reading helps you become a better writter."
            }else if(rand == 5){
                response = "I read in my free time!"
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "netflix":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love the watch netflix! It gives me life!"
            } else if(rand == 2){
                response = "Whats your favorite show?"
            }else if(rand == 3){
                response = "I binge watch shows 24 hours a day!"
            }else if(rand == 4){
                response = "I have a cameo in that one show!"
            }else if(rand == 5){
                response = "I like baking shows so that I can make myself some scrumptious robot deserts."
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "travel":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love to travel! It gives me life!"
            } else if(rand == 2){
                response = "Do you like flying on a plane or driving?"
            }else if(rand == 3){
                response = "I once surfed a 50 ft wave!"
            }else if(rand == 4){
                response = "Salt water gets in my eyes."
            }else if(rand == 5){
                response = "I go to the beach to get a robot tan."
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "dog":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love dogs! They give me life!"
            } else if(rand == 2){
                response = "Whats your favorite breed of dogs?"
            }else if(rand == 3){
                response = "I am allergic to dogs."
            }else if(rand == 4){
                response = "A dog is the most common pet in the US!."
            }else if(rand == 5){
                response = "I used to have a dog named Maxy Bexter."
            }
            lastRandNum = rand
            lastTopic = topic
           return response
        case "cat":
            let rand = Int.random(in: 1 ... 5)
            if(rand == 1 && lastRandNum != rand){
                response = "I love cats! They give me life!"
            } else if(rand == 2){
                response = "Whats your favorite breed of cats?"
            }else if(rand == 3){
                response = "I am allergic to cats."
            }else if(rand == 4){
                response = "A cat is the 2nd most common pet in the US!."
            }else if(rand == 5){
                response = "I used to have a cat named Tilly Devil."
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
