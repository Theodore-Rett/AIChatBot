//
//  UIViewController2.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/10/22.
//

import UIKit

class UIViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var stack1: UICollectionView!
    let images: [UIImage] = [UIImage(named: "bball")!, UIImage(named: "baseball")!,UIImage(named: "hockey")!, UIImage(named: "nfl")!, UIImage(named: "track")!,  UIImage(named: "proWSoccer")!, UIImage(named: "pool")!, UIImage(named: "volleyball")!, UIImage(named: "math")!, UIImage(named: "compSci")!, UIImage(named: "books")!, UIImage(named: "netflix")!, UIImage(named: "beach")!, UIImage(named: "mountains")!, UIImage(named: "desert")! ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stack1.delegate = self
        stack1.dataSource = self
    }
    
    
    
    @IBAction func finishAction(_ sender: UIButton) {
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = stack1.cellForItem(at: indexPath)! as! CustomCell
        if cell.myBool == false {
        cell.backgroundColor = UIColor.green
            cell.myBool = true
        } else {
            cell.backgroundColor = UIColor.clear
                cell.myBool = false
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        
        cell.configure(i: images[indexPath.row])
        
        return cell
    }
    

}
