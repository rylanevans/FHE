//
//  HomePageVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/2/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class HomePageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.instanceVC(name: "OpeningPrayerVC"),
                self.instanceVC(name: "SongVC"),
                self.instanceVC(name: "RuleVC"),
                self.instanceVC(name: "ScriptureVC"),
                self.instanceVC(name: "CalendarVC"),
                self.instanceVC(name: "TestimonyVC"),
                self.instanceVC(name: "SpotlightVC"),
                self.instanceVC(name: "MiscVC"),
                self.instanceVC(name: "ThoughtVC"),
                self.instanceVC(name: "LessonVC"),
                self.instanceVC(name: "CouncilVC"),
                self.instanceVC(name: "ClosingPrayerVC"),
                self.instanceVC(name: "ActivityVC"),
                self.instanceVC(name: "TreatVC")]
    }()
    
    func instanceVC(name: String) -> UIViewController {
        return UIStoryboard(name: "FHE", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        //        self.delegate = self
        //        configurePageControl()
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        for view in self.view.subviews {
    //            if view is UIScrollView {
    //                view.frame = UIScreen.main.bounds
    //            } else if view is UIPageControl {
    //                view.backgroundColor = UIColor.clear
    //            }
    //        }
    //    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    var pageControl = UIPageControl()
    
    //    func configurePageControl() {
    //        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
    //        pageControl.numberOfPages = orderedViewControllers.count
    //        pageControl.currentPage = 0
    //        pageControl.tintColor = UIColor.white
    //        pageControl.pageIndicatorTintColor = UIColor.lightGray
    //        pageControl.currentPageIndicatorTintColor = UIColor.blue
    //        self.view.addSubview(pageControl)
    //    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex != orderedViewControllers.count else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
}

