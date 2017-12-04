//
//  HomePageVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/2/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FamilyHomeEveningVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - View did load for FamilyHomeEveningVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.8451297283, green: 0.9193984866, blue: 0.9954796433, alpha: 1)
        
        self.dataSource = self
        self.delegate = self
        
        let pageControl: UIPageControl = UIPageControl.appearance(whenContainedInInstancesOf: [FamilyHomeEveningVC.self])
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1)
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    // MARK: - Ordered Page Views Array
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.instanceVC(name: "OpeningPrayer"),
                self.instanceVC(name: "Song"),
//                self.instanceVC(name: "Rule"),
                self.instanceVC(name: "Scripture"),
//                self.instanceVC(name: "Calendar"),
                self.instanceVC(name: "Testimony"),
                self.instanceVC(name: "Spotlight"),
//                self.instanceVC(name: "Misc"),
//                self.instanceVC(name: "Thought"),
                self.instanceVC(name: "Lesson"),
//                self.instanceVC(name: "Council"),
                self.instanceVC(name: "Activity"),
                self.instanceVC(name: "ClosingPrayer"),
                self.instanceVC(name: "Treat")]
    }()
    
    
    // MARK: - Instance View Controller
    
    func instanceVC(name: String) -> UIViewController {
        return UIStoryboard(name: "FHE", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    
    // MARK: - Page Control variable set up
    
    var pageControl = UIPageControl()
    
    
    // MARK: - Page Controller Animation
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    
    // MARK: - Page Controller scroll backward
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
            // if you want it to loop backwards return the following...
            // return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    // MARK: - Page Controller scroll forward
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex != orderedViewControllers.count else {
            return nil
            // if you want it to loop forward return the following...
            // return orderedViewControllers.first
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    // MARK: - Page Controller show how many dots
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    
    // MARK: - Page Controller show page dots on bottom
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }

}

