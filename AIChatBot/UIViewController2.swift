//
//  UIViewController2.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/10/22.
//

import UIKit

class UIViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var stack1: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stack1.delegate = self
        stack1.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

}
