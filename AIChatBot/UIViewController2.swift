//
//  UIViewController2.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/10/22.
//

import UIKit

class UIViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var stack1: UICollectionView!
    let images: [UIImage] = [UIImage(named: "bball")!, UIImage(named: "baseball")!,UIImage(named: "hockey")!, UIImage(named: "nfl")!, UIImage(named: "track")!,  UIImage(named: "proWSoccer")!, UIImage(named: "pool")!, UIImage(named: "volleyball")!, UIImage(named: "math")!, UIImage(named: "compSci")!, UIImage(named: "books")!, UIImage(named: "netflix")!,   UIImage(named: "beach")!, UIImage(named: "dog")!, UIImage(named: "cat")!]

    static var profile: Profile = Profile()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stack1.delegate = self
        stack1.dataSource = self
        
        if UserDefaults.standard.array(forKey: "likes") == nil {
            UserDefaults.standard.set(UIViewController2.profile.likes, forKey: "likes")
        } else {
            UIViewController2.profile.likes = UserDefaults.standard.array(forKey: "likes") as! [Bool]
        }
        
    }
    
    
    
    @IBAction func finishAction(_ sender: UIButton) {
        UserDefaults.standard.set(UIViewController2.profile.likes, forKey: "likes")
        UIViewController2.profile.toString()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = stack1.cellForItem(at: indexPath)! as! CustomCell
        if cell.myBool == false {
        cell.backgroundColor = UIColor.green
            cell.myBool = true
            UIViewController2.profile.likes[indexPath.row] = true
            setPreferance(index: indexPath.row, tf: true)
        } else {
            cell.backgroundColor = UIColor.clear
            cell.myBool = false
            UIViewController2.profile.likes[indexPath.row] = false
            setPreferance(index: indexPath.row, tf: false)
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        
        cell.configure(i: images[indexPath.row])
        if UIViewController2.profile.likes[indexPath.row] == true {
            cell.myBool = true
            cell.backgroundColor = UIColor.green
        } else {
            cell.myBool = false
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    
    func setPreferance(index: Int, tf: Bool) {
        
    switch index {
       
    case 0:
        UIViewController2.profile.basketball = tf
    case 1:
        UIViewController2.profile.baseball = tf
    case 2:
        UIViewController2.profile.hockey = tf
    case 3:
        UIViewController2.profile.football = tf
    case 4:
        UIViewController2.profile.track = tf
    case 5:
        UIViewController2.profile.soccer = tf
    case 6:
        UIViewController2.profile.swim = tf
    case 7:
        UIViewController2.profile.volleyball = tf
    case 8:
        UIViewController2.profile.math = tf
    case 9:
        UIViewController2.profile.computers = tf
    case 10:
        UIViewController2.profile.reading = tf
    case 11:
        UIViewController2.profile.netflix = tf
    case 12:
        UIViewController2.profile.beach = tf
    case 13:
        UIViewController2.profile.dog = tf
    case 14:
        UIViewController2.profile.cat = tf
        
    default:
        print("default")
    
        
        
        
    }
        
        
    }
    

}
