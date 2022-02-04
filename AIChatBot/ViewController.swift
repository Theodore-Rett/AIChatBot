//
//  ViewController.swift
//  AIChatBot
//
//  Created by TEAGAN RETT on 1/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseOutlet: UITextField!
    
    @IBOutlet weak var AIresponse: UILabel!
    
    var wordArray: [Substring] = []
    let convoVocabulary = ConversationTopicDataBase()
    var responseDataBase: ResponseGenerator!
    var emotion : String = ""
    
    @IBOutlet weak var botDisplay: UIImageView!
    
    var currentTopic = "N/A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
//        if UserDefaults.standard.array(forKey: "likes") == nil {
//            UserDefaults.standard.set([String].self, forKey: "likes")
//        }
        responseDataBase = ResponseGenerator()
        emotion = responseDataBase.emotion
        
        if(emotion == "neutral"){
            botDisplay.image = UIImage(named: "neutral")
        } else if(emotion == "happy"){
            botDisplay.image = UIImage(named: "happy")
        } else if(emotion == "computing"){
            botDisplay.image = UIImage(named: "computing")
        } else if(emotion == "error"){
            botDisplay.image = UIImage(named: "error")
        } else if(emotion == "greeting"){
            botDisplay.image = UIImage(named: "greeting")
        } else if(emotion == "off"){
            botDisplay.image = UIImage(named: "off")
        } else if(emotion == "questioning"){
            botDisplay.image = UIImage(named: "questioning")
        } else if(emotion == "sad"){
            botDisplay.image = UIImage(named: "sad")
        } else if (emotion == "surprised"){
            botDisplay.image = UIImage(named: "surprised")
        }
        
        
    }

    @IBAction func unwindHome(_ seg: UIStoryboardSegue ) {
        print("unwinding home")
    }
    
    
    @IBAction func sendAction(_ sender: UIButton) {
        if let response = responseOutlet.text {
    filterResponse(response: response)
        } //only runs of there is something in the outlet
        responseOutlet.text = ""
        respond()
    }
    
    
    
    func filterResponse(response: String) {
        responseDataBase.resetLikes()
        var question: Bool = false
        var excited: Bool = false
        wordArray = []
        
        if response != "" && " " != response.first { //error will show up if not true
        
        var temp = response
        var subTemp: Substring = "" //cuts off the previous word it just stored into wordarray
            
        temp = temp.uppercased()
        if check(response: response) == true { //there is a space at the end
                print("Here \(temp.remove(at: temp.index(before: temp.endIndex)))")
        }
            
            if temp.last == "?" {
                question = true
                responseDataBase.question = true
            } else if temp.last == "!" {
                excited = true
                responseDataBase.excited = true
            } else {
                responseDataBase.question = false
                responseDataBase.excited = false
            }
        
        if let wordInd = temp.firstIndex(of: " ") {
        let wordIndAfter = temp.index(after: wordInd)
        let wordIndBefore = temp.index(before: wordInd)
        wordArray.append(temp[...wordIndBefore])
            subTemp = temp[wordIndAfter...]
            
            repeat {
               if let wordInd = subTemp.firstIndex(of: " ") {
               let wordIndAfter = subTemp.index(after: wordInd)
               let wordIndBefore = temp.index(before: wordInd)
               wordArray.append(subTemp[...wordIndBefore])
                   subTemp = temp[wordIndAfter...]
               } else {
                   print("no spaces in string")
               }
                
            }while(subTemp.firstIndex(of: " ") != nil);
            let afterEnd = subTemp.endIndex
            let endInd = subTemp.index(before: afterEnd)
            wordArray.append(subTemp[...endInd])
        } else {
            wordArray.append(temp.dropFirst(0))
            print("no spaces in string")
        }

        
        print(wordArray)
    }
        var i = 0
        for each in wordArray {
            if each.last == "," || each.last == "." || each.last == "?" || each.last == "!" {
                print(wordArray[i].removeLast())
            }
            i += 1
        }
        
        
    }
    
    
    func respond() {
        let array = convoVocabulary.getArray()
        
        for topic in array {
            for each in topic {
                for word in wordArray {
                    if word == each {
                        responseDataBase.likesArray.append(topic)
                    }
                }
            }
        }
        
        var sports = 0
        var basketball = 0
        var baseball = 0
        var volleyball = 0
        var hockey = 0
        var football = 0
        var soccer = 0
        var swimming = 0
        var running = 0
        var school = 0
        var classes = 0
        var computerScience = 0
        var math = 0
        var english = 0
        var history = 0
        var science = 0
        var media = 0
        var netflix = 0
        var reading = 0
        var time = 0
        var travel = 0
        var hobbies = 0
        
        for topic in responseDataBase.likesArray{
            if(topic == convoVocabulary.sports){
                sports += 1
            } else if(topic == convoVocabulary.basketball){
                basketball += 1
            } else if(topic == convoVocabulary.baseball){
                baseball += 1
            } else if(topic == convoVocabulary.volleyball){
                volleyball += 1
            } else if(topic == convoVocabulary.hockey){
                hockey += 1
            } else if (topic == convoVocabulary.football){
                football += 1
            } else if(topic == convoVocabulary.soccer){
                soccer += 1
            } else if(topic == convoVocabulary.swimming){
                swimming += 1
            } else if(topic == convoVocabulary.running){
                running += 1
            } else if(topic == convoVocabulary.school){
                school += 1
            } else if(topic == convoVocabulary.classes){
                classes += 1
            } else if(topic == convoVocabulary.computerScience){
                computerScience += 1
            } else if(topic == convoVocabulary.math){
                math += 1
            } else if(topic == convoVocabulary.english){
                english += 1
            } else if(topic == convoVocabulary.history){
                history += 1
            } else if(topic == convoVocabulary.science){
                science += 1
            } else if(topic == convoVocabulary.media){
                media += 1
            } else if(topic == convoVocabulary.netflix){
                netflix += 1
            } else if(topic == convoVocabulary.reading){
                reading += 1
            } else if(topic == convoVocabulary.time){
                time += 1
            } else if(topic == convoVocabulary.travel){
                travel += 1
            } else if(topic == convoVocabulary.hobbies){
                hobbies += 1
            }
        }
        
        var mostCount = 0
        
        if(mostCount < sports){
            mostCount = sports
            currentTopic = "sports"
        }
        if(mostCount < basketball){
            mostCount = basketball
            currentTopic = "basketball"
        }
        if(mostCount < baseball){
            mostCount = baseball
            currentTopic = "baseball"
        }
        if(mostCount < volleyball){
            mostCount = volleyball
            currentTopic = "volleyball"
        }
        if(mostCount < hockey){
            mostCount = hockey
            currentTopic = "hockey"
        }
        if(mostCount < soccer){
            mostCount = soccer
            currentTopic = "soccer"
        }
        if(mostCount < swimming){
            mostCount = swimming
            currentTopic = "swimming"
        }
        if(mostCount < running){
            mostCount = running
            currentTopic = "running"
        }
        if(mostCount < school){
            mostCount = school
            currentTopic = "school"
        }
        if(mostCount < classes){
            mostCount = classes
            currentTopic = "classes"
        }
        if(mostCount < computerScience){
            mostCount = computerScience
            currentTopic = "computerScience"
        }
        if(mostCount < math){
            mostCount = math
            currentTopic = "math"
        }
        if(mostCount < english){
            mostCount = english
            currentTopic = "english"
        }
        if(mostCount < history){
            mostCount = history
            currentTopic = "history"
        }
        if(mostCount < science){
            mostCount = science
            currentTopic = "science"
        }
        if(mostCount < media){
            mostCount = media
            currentTopic = "media"
        }
        if(mostCount < netflix){
            mostCount = netflix
            currentTopic = "netflix"
        }
        if(mostCount < reading){
            mostCount = reading
            currentTopic = "reading"
        }
        if(mostCount < time){
            mostCount = time
            currentTopic = "time"
        }
        
        if(mostCount < travel){
            mostCount = travel
            currentTopic = "travel"
        }
        if(mostCount < hobbies){
            mostCount = hobbies
            currentTopic = "hobbies"
        }
        
        print("Currently talking about \(currentTopic)")
        responseDataBase.topic = currentTopic
        
        print(responseDataBase.likesArray)
        responseDataBase.resetLikes()
        AIresponse.text = responseDataBase.genResponse(array: wordArray)
    }
    
    
    
    func check(response: String) -> Bool {
        if response.lastIndex(of: " ") == response.index(before: response.endIndex) {
            return true
        }
        return false
    }

}
