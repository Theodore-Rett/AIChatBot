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
        AIresponse.text = generateUIResponse()
    }
    
    
    
    func filterResponse(response: String) {
        wordArray = []
        //response = response.lowercased() //all lowercase response
        if check(response: response) == true {
            
        }
        
        let temp = response
        var subTemp: Substring = "" //cuts off the previous word it just stored into wordarray
        
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
    
    
    func generateUIResponse() -> String {
        let response = ""
        let array = convoVocabulary.getArray()
        
        for topic in array {
            for each in topic {
                for word in wordArray {
                    if word == each {
                        //code for response
                    }
                }
            }
        }
        
        
        
        return response
    }
    
    
    
    func check(response: String) -> Bool {
        if response.lastIndex(of: " ") == response.index(before: response.endIndex) {
            return true
        }
        return false
    }

}

