//
//  MoreTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class MoreTVC: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: thankYou()
        case 1: likeIt()
        case 2: loveIt()
        case 3: amazing()
        case 4: positiveFeedback()
        case 5: reportProblem()
        case 6: suggestions()
        case 7: subscribe()
        default:
            print("Error with MoreTVC index selection")
        }

    }
    
    func thankYou() {
        print("Thank you")
    }
    
    func likeIt() {
        print("Like it")
    }
    
    func loveIt() {
        print("Love it")
    }
    
    func amazing() {
        print("Amazing")
    }
    
    func positiveFeedback() {
        print("Positive feedback")
    }
    
    func reportProblem() {
        print("Report a problem")
    }
    
    func suggestions() {
        print("Suggestions")
    }
    
    func subscribe() {
        print("Subscribe")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
