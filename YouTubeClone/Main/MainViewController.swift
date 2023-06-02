//
//  MainViewController.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 26/5/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootPageViewController: RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageViewController = destination
            addChild(rootPageViewController)
                    view.addSubview(rootPageViewController.view)
                    rootPageViewController.view.frame = view.bounds
                    rootPageViewController.didMove(toParent: self)
                }
        }
    }

extension MainViewController: RootPageProtocol {
    func currentPage(_ index: Int) {
        print("currentPage", index)
    }
    
}
