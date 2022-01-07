//
//  ViewController.swift
//  AIChatBot
//
//  Created by TEAGAN RETT on 1/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseOutlet: UITextField!
    var wordArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func filterResponse(response: String) {
      var temp = response
        
        if let wordInd = temp.firstIndex(of: " ") {
        var wordIndAfter = temp.index(after: wordInd)
            wordArray.append(temp[...wordIndAfter])
            temp = temp[wordInd...]
        } else { //let newStr = str[..<index]
            print("no spaces in string")
        }
      
        
    }
    

}

