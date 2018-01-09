//
//  PeersViewController.swift
//  MemorySpot
//
//  Created by Shivam Dave on 11/4/17.
//  Copyright © 2017 ShivamDave. All rights reserved.
//

import UIKit

class PeersViewController: UIViewController {

   
    var navTitleView = UIView()
    var searchBar = UISearchBar()
    var menuBarButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 27, g: 39, b: 53)
        UIApplication.shared.statusBarStyle = .lightContent
        
        setUpNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNavBar(){
        navTitleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        navTitleView.addSubview(containerView)
        
        let nameLabel = UILabel()
        nameLabel.text = "Peers"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: navTitleView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: navTitleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = navTitleView
        self.navigationController?.navigationBar.barTintColor = UIColor(r: 36, g: 60, b: 88)
        
        
        menuBarButton = UIBarButtonItem()
        menuBarButton?.image = UIImage(named: "menu")
        menuBarButton?.tintColor = UIColor.white
        
        if(revealViewController() != nil){
            menuBarButton?.target = self.revealViewController()
            menuBarButton?.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        }
        self.navigationItem.leftBarButtonItem = menuBarButton
    }

}
