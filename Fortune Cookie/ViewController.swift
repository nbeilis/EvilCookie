//
//  ViewController.swift
//  Fortune Cookie
//
//  Created by Nicole Beilis on 8/3/19.
//  Copyright © 2019 nickelogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cookieFace: UIImageView!
    
   // @IBOutlet weak var fortuneLabel: UILabel!
   
    @IBOutlet weak var fortuneTextView: UITextView!
    
    var clickCounter = 0
    let cookieArray = ["1.originalcookie", "2.bitbroken", "3. broken", "4.morebroken", "5.morerbroke", "6.done"]
    
//    let adj2Array = ["colorful", "dumb", "aggressive", "boring", "bossy", "cruel", "cowardly", "grumpy", "moody", "selfish", "miserable", "greedy", "impatient", "childish", "jealous", "fussy", "rude", "ugly", "evil", "old", "unfortunate", "green", "yellow", "round", "sharp", "maroon", "horrible", "immature", "painted", "defeated", "clumsy", "thoughtless", "obnoxious", "pitiful", "cracked", "ripped", "broken", "snapped", "abominable", "reprehensible", "intolerable", "illiterate", "troublesome", "undeserving"]
//    let adjArray = ["nasty", "nauseating", "aloof", "inconsiderate", "arrogant", "pompous", "vain", "coward", "callous", "cynical", "impolite", "sneaky", "pig-headed", "unreliable", "lazy", "careless", "foolish", "sullen", "silly"]
    let adjArray = ["nasty", "nauseating", "aloof", "inconsiderate", "arrogant", "pompous", "vain", "coward", "callous", "cynical", "impolite", "sneaky", "pig-headed", "unreliable", "lazy", "careless", "foolish", "sullen", "silly", "colorful", "dumb", "aggressive", "boring", "bossy", "cruel", "cowardly", "grumpy", "moody", "selfish", "miserable", "greedy", "impatient", "childish", "jealous", "fussy", "rude", "ugly", "evil", "old", "unfortunate", "green", "yellow", "round", "sharp", "maroon", "horrible", "immature", "painted", "defeated", "clumsy", "thoughtless", "obnoxious", "pitiful", "cracked", "ripped", "broken", "snapped", "abominable", "reprehensible", "intolerable", "illiterate", "troublesome", "undeserving", "bitter", "bland"]
    let swearArray = ["fucking ", "moronic ", "bitchy ", "dipshit ", "idiotic ", "bullshit ", "four-eyed ", "asshat ", "shithead ", "bimbo ", "blockhead ", "buffoon ", "clown ", "coward ", "dimwitted ", "shit ", "ass ", "twat ", "goddamn ", "", "bloody ", "damn "]
    //let swearArray = [""]
    let nounArray = ["duck", "chair", "elbow", "book", "wall", "school", "person", "jail", "calculator", "phone", "door", "ankle", "neck", "cat", "dog", "goldfish", "bird", "lamp", "cookie", "can", "blanket", "crocodile", "towel", "shoe", "gift", "glasses", "dinosaur", "brick", "puddle", "curtain", "couch", "potato", "fridge", "tv", "window", "cushion", "pen", "llama", "pastry", "waffle", "goblin", "clown"]
    
    let randomArray = ["you're broke", "Error 404: Fortune Gone", "you will die alone", "as smart as a goldfish", "your outfit is lame", "You are not illiterate", "Shit your pants", "Clean your room dumbo", "Yeehaw bitch", "You need a mint", "rice in your teeth", "trajeudi"]
    
    @IBAction func cookieButton(_ sender: UIButton) {
        clickCounter += 1
        if clickCounter >= 0 && clickCounter < 6 {
            cookieFace.image = UIImage(named: cookieArray[clickCounter])
        }
        
        fortuneTextView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 10)
        
        if clickCounter == 5 {
            var text = ""
            repeat {
                let randomIndex = Int.random(in: 0 ... 200)
                if (randomIndex >= 1 && randomIndex <= randomArray.count) {
                    text = randomArray[randomIndex - 1]
                }
                else {
                    let randomAdjIndex = Int.random(in: 0 ... adjArray.count-1)
                    
                    let randomSwearIndex = Int.random(in: 0 ... swearArray.count-1)
                    //let randomAdj2Index = Int.random(in: 0 ... adj2Array.count-1)
                    
                    let randomNounIndex = Int.random(in: 0 ... nounArray.count-1)
                    
                    fortuneTextView.adjustsFontForContentSizeCategory = true
                text = "\(adjArray[randomAdjIndex]) \(swearArray[randomSwearIndex])\(nounArray[randomNounIndex])"
                    //"\(adjArray[randomAdjIndex]) \(adj2Array[randomAdj2Index]) \(nounArray[randomNounIndex])"
                }
            } while text.count > 23
            self.fortuneTextView.text = text
        }
    }
  
    @IBAction func retryButton(_ sender: UIButton) {
        cookieFace.image = UIImage(named: cookieArray[0])
        clickCounter = 0
        self.fortuneTextView.text = ""
    }
    
    @IBAction func infoButton(_ sender: UIButton) {
        //new code for DESIGNED POPUP
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
//        self.addChild(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
        
        //old code for APPLE POPUP
        let info = UIAlertController(title: "Info", message: "Tap the cookie until it breaks to receive your evil fortune.\nPress the reset button to retry.\nTo share your fortune, click the plane.", preferredStyle: .alert)

        info.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(info, animated: true)
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        //makes cropped screenshot
        let cgsize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height-300)
        let cgrect = CGRect(x: 0, y: -150, width: view.bounds.size.width, height: view.bounds.size.height)
        UIGraphicsBeginImageContextWithOptions(cgsize, false, 0);
        self.view.drawHierarchy(in: cgrect, afterScreenUpdates: true)
        let screenshot:UIImage = (UIGraphicsGetImageFromCurrentImageContext())!;
        
        //sends screenshot
        let items = [screenshot]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}

