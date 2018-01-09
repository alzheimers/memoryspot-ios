//
//  SideBarViewController.swift
//  MemorySpot
//
//  Created by Shivam Dave on 10/27/17.
//  Copyright © 2017 ShivamDave. All rights reserved.
//

import UIKit

class SideBarViewController: UIViewController {

    let cellID = "SideBarTableViewCell"
    let sideBarSegues: [String] = ["Timeline", "Peers", "Map", "Settings", "Help"]
    let imageIcons: [UIImage] = [UIImage(named: "landscape1")!, UIImage(named: "landscape2")!, UIImage(named: "landscape3")!, UIImage(named: "landscape1")!, UIImage(named: "landscape2")!]
    
    let profileView: UIView = {
        let pv = UIView()
        pv.backgroundColor = UIColor(r: 36, g: 60, b: 88)
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        return pv
    }()
    
    let profileImageView: UIImageView = {
        let pv = UIImageView()
        pv.image = UIImage(named: "landscape3")
        pv.layer.borderWidth = 0.5
        pv.layer.masksToBounds = false
        pv.layer.borderColor = UIColor.clear.cgColor
        pv.layer.cornerRadius = 37
        pv.clipsToBounds = true
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        return pv
    }()
    
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.text = "John Smith"
        nl.textColor = UIColor.white
        nl.font = UIFont(name: "Helvetica Neue", size: 30)
        nl.translatesAutoresizingMaskIntoConstraints = false
        
        return nl
    }()
    
    
    let menuTableView: UITableView = {
        let mv = UITableView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 27, g: 39, b: 53)
        
        view.addSubview(profileView)
        view.addSubview(menuTableView)
        
        profileViewConstraints()
        menuTableViewConstraints()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(SideBarTableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func profileViewConstraints(){
        profileView.addSubview(profileImageView)
        profileView.addSubview(nameLabel)
        
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: view.frame.height/5).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 10).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: profileView.rightAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func menuTableViewConstraints(){
        menuTableView.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}


extension SideBarViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideBarSegues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SideBarTableViewCell
        cell.imageIcon.image = imageIcons[indexPath.row]
        cell.sideBarSegueLabel.text = sideBarSegues[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(r: 220, g: 220, b: 220).cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        let cell: SideBarTableViewCell = menuTableView.cellForRow(at: indexPath) as! SideBarTableViewCell
        
        if(cell.sideBarSegueLabel.text! == "Timeline"){
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "TimelineViewController") as! TimelineViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        else if(cell.sideBarSegueLabel.text! == "Peers"){
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "PeersViewController") as! PeersViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        else if(cell.sideBarSegueLabel.text! == "Map"){
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        else if(cell.sideBarSegueLabel.text! == "Settings"){
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        else if(cell.sideBarSegueLabel.text! == "Help"){
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
    }
}


















