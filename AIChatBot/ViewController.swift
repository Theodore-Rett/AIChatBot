//
//  ViewController.swift
//  AIChatBot
//
//  Created by TEAGAN RETT on 1/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseOutlet: UITextField!
    var wordArray: [Substring] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func sendAction(_ sender: UIButton) {
        if let response = responseOutlet.text {
    filterResponse(response: response)
        } //only runs of there is something in the outlet
        responseOutlet.text = ""
    }
    
    
    
    func filterResponse(response: String) {
        wordArray = []
        
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
    
    func check(response: String) -> Bool {
        if response.lastIndex(of: " ") == response.index(before: response.endIndex) {
            return true
        }
        return false
    }

}

