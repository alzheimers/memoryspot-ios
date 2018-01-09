//
//  ViewController.swift
//  MemorySpot
//
//  Created by Shivam Dave on 10/27/17.
//  Copyright © 2017 ShivamDave. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    
    var timeline: TimelineView!
    
    var allFilesTypes = [String]()
    var filteredAllFilesTypes = [String]() //for search bar filter
    
    var allFiles = [Any]()
    var filteredFiles = [Any]() //for search bar filter
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()

    
    var navTitleView = UIView()
    var searchBar = UISearchBar()
    var menuBarButton: UIBarButtonItem?
    var searchBarButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(r: 27, g: 39, b: 53)
        UIApplication.shared.statusBarStyle = .lightContent
        
        setUpNavBar()
        
        view.addSubview(scrollView)
        
        view.addConstraints([
            NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 29),
            NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
            ])
        
        timeline = TimelineView(bulletType: .circle, timeFrames: [
            TimeFrame(text: "New Year's Day", date: "January 1", image: UIImage(named: "landscape3")),
            TimeFrame(text: "The month of love!", date: "February 14", image: UIImage(named: "landscape2")),
            TimeFrame(text: "Comes like a lion, leaves like a lamb", date: "March",  image: nil),
            TimeFrame(text: "Dumb stupid pranks.", date: "April 1", image: UIImage(named: "landscape1")),
            TimeFrame(text: "That's right. No image is necessary!", date: "No image?", image: nil),
            TimeFrame(text: "This control can stretch. It doesn't matter how long or short the text is, or how many times you wiggle your nose and make a wish. The control always fits the content, and even extends a while at the end so the scroll view it is put into, even when pulled pretty far down, does not show the end of the scroll view.", date: "Long text", image: nil),
            TimeFrame(text: "Hope this helps someone!", date: "That's it!", image: nil)
            ])
        
        timeline.delegate = self
        
        setUpScrollView(timeline: timeline)
        
        view.sendSubview(toBack: scrollView)
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
        nameLabel.text = "Timeline"
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
        
        searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        searchBarButton?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = searchBarButton
        searchBar.delegate = self
    }
    
    
    func setUpScrollView(timeline: TimelineView){
        scrollView.frame = view.bounds
        scrollView.addSubview(timeline)
        
        scrollView.addConstraints([
            NSLayoutConstraint(item: timeline, attribute: .left, relatedBy: .equal, toItem: scrollView, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .right, relatedBy: .equal, toItem: scrollView, attribute: .right, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: timeline, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1.0, constant: 0)
            ])
    }
    
    
    func showSearchBar(){
        let cancelButtonAttributes: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as? [String : AnyObject], for: .normal)
        self.navigationItem.titleView = searchBar
        searchBar.alpha = 0
        navigationItem.setLeftBarButton(nil, animated: true)
        navigationItem.setRightBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.3, animations: {
            self.searchBar.alpha = 1
            self.searchBar.showsCancelButton = true
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    func add(){
    }
    
    
}

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha:1)
        
    }
}


extension TimelineViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        filteredFiles = allFiles //reset filters
        filteredAllFilesTypes = allFilesTypes
        //allFilesTableView.reloadData()
        searchBar.resignFirstResponder()
        navTitleView.alpha = 0
        self.navigationItem.titleView = navTitleView
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationItem.setRightBarButton(self.searchBarButton, animated: true)
            self.navigationItem.setLeftBarButton(self.menuBarButton, animated: true)
            self.navTitleView.alpha = 1
        }, completion: { finished in
            
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       /* var index = 0
        filteredFiles = allFiles //reset filters
        filteredAllFilesTypes = allFilesTypes
        // When there is no text, filteredFiles is the same as allFiles
        filteredFiles = searchText == "" ? allFiles : filteredFiles.filter { (item: Any) -> Bool in
            let includesText: Bool!
            // If dataItem matches the searchText, return true to include it
            if item is AudioFile {
                includesText = (item as! AudioFile).title!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            } else {
                includesText = (item as! Folder).name!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            if !includesText {
                // file should be filtered out, update the allfiles array as well
                self.filteredAllFilesTypes.remove(at: index)
            } else {
                // file shouldn't be removed, so increment index by 1
                index += 1
            }
            return includesText
        }
       // allFilesTableView.reloadData()*/
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
}



extension TimelineViewController: SegueDelegate{
    
    func handleSegueDelegate(button: UIButton) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dezController = mainStoryBoard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
       // dezController.eventDetails = TimeFrame(text: text, date: title, image: image)
        dezController.previousController = "TimelineViewController"
        let newFrontViewController = UINavigationController.init(rootViewController: dezController)
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        print("Handle Segue")
    }
}


























































































