//
//  ViewController.swift
//  PullToRefreshAnimation
//
//  Created by Larry Natalicio on 4/25/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit


// 干掉 MJRefresh

class ViewController: UITableViewController, PullRefreshViewDelegate {
    
    // MARK: - Types
    
        struct ColorPalette {
            static let pruple = UIColor(red:0.31, green:0.20, blue:0.49, alpha:1.0)
            static let backgroundColor = UIColor(red: 43/255, green: 35/255, blue: 77/255, alpha: 1)
        }
    

    // MARK: - Properties
    
    var pullRefreshView: PullRefreshView!
    let kPullRefreshViewHeight: CGFloat = UIScreen.main.bounds.size.height * 0.22
    
    let items = ["Avatar", "Star Wars", "Interstellar", "Predator", "The Martian",
                 "They Live", "Contact", "Alien", "Independence Day", "Signs",
                 "District 9", "Superman Returns"]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
        configureNavBar()
        view.backgroundColor = ColorPalette.backgroundColor
        
        // Part of pull-to-refresh animation.
        
        configureRefreshRect()
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pullRefreshView.scrollViewDidScroll(scrollView)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        pullRefreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
 
    // MARK: - Convenience
    
    func pullRefreshViewDidRefresh(_ pullRefreshView: PullRefreshView) {
        // 动画时间 2.5 s
        delay(seconds: 2.5) {
            pullRefreshView.endRefreshing()
        }
    }
    
    func configureRefreshRect() {
        let refreshRect = CGRect(x: 0.0, y: -kPullRefreshViewHeight, width: view.frame.size.width, height: kPullRefreshViewHeight)
        pullRefreshView = PullRefreshView(frame: refreshRect, scrollView: tableView)
        pullRefreshView.delegate = self
        view.addSubview(pullRefreshView)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.barTintColor = ColorPalette.pruple
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
}






extension ViewController{
    
    
    // MARK: - UITableViewDataSource
     
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
         cell.textLabel!.text = items[indexPath.row]
         return cell
     }
     
     // MARK: - UITableViewDelegate
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
     }
     
    
    
}



