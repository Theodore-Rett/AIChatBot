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
    let responseDataBase = ResponseGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
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

