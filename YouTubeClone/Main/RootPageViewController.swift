//
//  RootPageViewController.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 26/5/23.
//

import UIKit

protocol RootPageProtocol: AnyObject {
    func currentPage(_ index: Int)
}

class RootPageViewController: UIViewController {
    
    var subViewControllers = [UIViewController]()
    var rootPageViewController = UIPageViewController()
    var currentIndex: Int = 0
    weak var delegateRoot: RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootPageViewController.delegate = self
        rootPageViewController.dataSource = self
        setupViewControllers()
    }
   private func setupViewControllers() {
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistViewController(),
            ChannelsViewController(),
            AboutViewController()
        ]
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        setupViewControllersFromIndex(index: 0, direction: .forward)
    }
   
    func setupViewControllersFromIndex(index: Int, direction: UIPageViewController.NavigationDirection, animated: Bool = true){
        setupViewControllersFromIndex(index: index, direction: direction, animated: animated)
    }
    
}

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0 {
            return nil
        }
        return subViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[index + 1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished", finished)
        if let index = pageViewController.viewControllers?.first?.view.tag {
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
    
    
}
