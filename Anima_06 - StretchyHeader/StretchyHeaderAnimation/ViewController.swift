//
//  ViewController.swift
//  StretchyHeaderAnimation
//
//  Created by Larry Natalicio on 4/21/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit



// 不是动画，就是插值，UI 响应用户的行为，下拉，上拉
class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    let tableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!
    
    let places = [
        Place(place: "Neuschwanstein Castle"),
        Place(place: "Yosemite National Park"),
        Place(place: "Times Square"),
        
        Place(place: "Tokyo"),
        Place(place: "Hawaii"),
        Place(place: "Eiffel Tower"),
        
        Place(place: "Rio de Janeiro"),
        Place(place: "Turkey"),
        Place(place: "Golden Gate Bridge"),
        
        Place(place: "Caribbean Islands")
    ]
    
    // MARK: - View Life Cycle

      override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        updateHeaderView()
     
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let place = places[indexPath.row]
        cell.textLabel?.text = place.placeTitle
        
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: - Convenience
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        // 决定拉动的方向
        if tableView.contentOffset.y < -tableHeaderHeight {
            // 就是改 frame
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    
    // MARK: - Satus Bar
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

}
