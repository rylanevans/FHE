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
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - The “✓” in front of the task Title means there are multiple choices and that's the one you selected.\n\nTIP - When you are ready with the selected tasks and desired assignments press the “BEGIN” button to start your family meeting.\n\nTIP - Turn your phone sideways to view in landscape mode.\n\nTIP - Pair your phone to your family room TV for all to see.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func familyTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Add new family members by tapping the “+” icon in the top right corner. Or edit existing ones by tapping on the cell you want to edit.\n\nTIP - Age is only used for sorting. Once it's entered you don't have to edit it again, because everyone grows at the same pace.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tasksTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press the “Auto-Assign” button on the top to manually assign someone permanently. Otherwise leave it blank for auto-assign to work.\n\nTRICK - Select the desired section from the sort & filter bar to arrange which and how your lessons will be displayed. Also, the “★” in the sort & filter bar means “favorites only”.\n\nTRICK - Type in the search bar to find a specific lesson.\n\nTRICK - Press the empty box to select the lesson you would like to share in your next family meeting.\n\nTIP - The “▶️” (play) icon is a visual indicator that the lesson is a YouTube video.\n\nTIP - Subtitle in the center of each lesson is the category.\n\nTIP - The “blue-boxed-text” in the bottom right of each lesson is the topic.\n\nTRICK - The “👁‍🗨” (eye) icon is a button that allows you to preview the lesson video/details from the URL provided.\n\nTIP - Press the “+” (plus) icon in the top right corner to add a new lesson.\n\nTIP - Select any lesson, by tapping the row, to edit or delete it.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func assignmentTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press the profile icon with a “✓” on it to make ALL tasks “Auto-Assign” with one button.\n\nTRICK - Press the “♲” (recycle) button to rotate your family member assignments. It will only rotate with tasks that are on “Auto-Assign”. Any task that you manually assign will not rotate.\n\nTRICK - Tap on the “Auto” or “Manual” text by a family members picture to manually or automatically assign that specific task.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func songTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press any of the orange “Sing Song” button in the center bottom of the screen to open the link for more info. For the song, press it to sing-a-long with the music and lyrics. Make sure to press “▶️” (play) button on the web page to hear the music.\n\nTIP - Only one song can be selected at a time.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func rulesTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - I suggest creating your own family rules using Google Docs. Once created, you can right click the Google Doc file to “get shareable link” and paste that in the URL for your custom rule(s). In my family, we have found reviewing rules regulary in our family meetings helps create better awareness, acceptance, and compliance.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func spotlightTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - Spotlight is designed to be opposite of the other tasks. Instead of the assignee leading, they stand in the spotlight while everyone else takes turns and gives that person meaningful compliments.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func lessonTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - If you are adding a lesson with a YouTube video, you'll need to confirm 3 things:\n1) the URL address MUST be secure and include “https://www.”\n2) the URL needs to end with the video ID# after “watch?v=”. For example, “https://www.youtube.com/watch?v=ABCDEFGHIJK”\n3) Select the box to confirm your URL is a direct link to a YouTube video.\nIf your lesson is not a YouTube video enter your Title, details and any secure URL that begins with “https://www.”\n\nTIP - Whoever is assigned the lesson can talk before or after sharing a video or visiting a URL with the planned lesson. Have a discussion, allow for questions, share thoughts, etc.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func testimonyTipsTricks(_ sender: Any) {
        let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - The testimony bullet points are only a list of suggestions. Pick one or more bullet points to testify about to your family members. Don't stress about the whole list. You can always edit the suggested list in the testimony task.", preferredStyle: .alert)
        
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
