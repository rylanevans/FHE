//
//  TutorialTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class TutorialTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func videoTutorialsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "https://www.youtube.com/playlist?list=PLbuu8VeGQ5COhd6o3WYSzZ5nO9eBzexQF")!
        
        let videoTutorialsWebVC = SFSafariViewController(url: URL as URL)
        videoTutorialsWebVC.delegate = self
        
        present(videoTutorialsWebVC, animated: true, completion: nil)
    }
    
    @IBAction func orderAppleTVButtonPressed(_ sender: Any) {
        let id = "B075NCMLYL"
        let url = NSURL(string: "com.amazon.mobile.shopping.web://amazon.com/gp/product/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.amazon.com/gp/product/B075NCMLYL")!
            
            let amazonWebVC = SFSafariViewController(url: URL as URL)
            amazonWebVC.delegate = self
            
            present(amazonWebVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func orderHDMIButtonPressed(_ sender: Any) {
        let id = "B009WHV3BM"
        let url = NSURL(string: "com.amazon.mobile.shopping.web://amazon.com/gp/product/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.amazon.com/gp/product/B009WHV3BM")!
            
            let amazonWebVC = SFSafariViewController(url: URL as URL)
            amazonWebVC.delegate = self
            
            present(amazonWebVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func homeTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - Anything in orange text or an orange image is a button or a link to something. Try it out!\n\nTIP - Turn your phone sideways to view in landscape mode.\n\nTRICK - Pair your phone to your family room TV for all to see. There is suggested hardware just above in the “Display” tutorial.\n\nTRICK - Once you have began your FHE, press on the orange “🏠” (home) button in the top left corner to exit out and return to the home screen.\n\nOnce you have began your FHE, press any of the orange “Details” buttons in the center bottom of the screen to open the link for more info.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func familyTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - Press the “+” (plus) icon in the top right corner to add a new family member.\n\nTIP - Select any family memebr, by tapping the row, to edit or delete them.\n\nTRICK - Flip the switch “ON” for any family member or guest attending your family meeting.\n\nSee tutorials in the “More” tab for video demos or to review any of the tips and tricks you see.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tasksTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Flip the switch “ON” for any task to enable it for your family meeting. With the switch “OFF” it will not appear.\n\nTIP - Select a task, by tapping the desired row, to make edits or to make a selection.\n\nTIP - I suggest you turn everything on the first time to get an idea of what's avaliable and which ones you may like to have enabled for your family.TIP - Spotlight is designed to be opposite of the other tasks. Instead of the assignee leading, they stand in the spotlight while everyone else takes turns and gives that person meaningful compliments.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func assignmentTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press the “♲” (recycle) button to auto-rotate your family assignments.\n\nTRICK - Tap on the “Auto” or “Manual” text by a family members picture to manually or automatically assign that specific task.\n\nTRICK - Tap on the task Title to make quick edits or make a selection for the specific song, scripture, lesson, etc.\n\nTRICK -  The “✓” in front of the task Title means there are multiple choices and that's the one you selected.\n\nTIP - Press the “BEGIN” button to display and swipe through your all enabled tasks and their assignments one-by-one.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension TutorialTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
