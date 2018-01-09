//
//  SideBarTableViewCell.swift
//  MemorySpot
//
//  Created by Shivam Dave on 11/4/17.
//  Copyright © 2017 ShivamDave. All rights reserved.
//

import Foundation
import UIKit

class SideBarTableViewCell: UITableViewCell {
    
    let sideBarSegueLabel: UILabel = {
        let sb = UILabel()
        sb.textAlignment = NSTextAlignment.left
        sb.font = UIFont(name: "Helvetica Neue", size: 25)
        sb.textColor = UIColor(r: 27, g: 39, b: 53)
        sb.translatesAutoresizingMaskIntoConstraints = false
        
        return sb
    }()
    
    let imageIcon: UIImageView = {
        let pv = UIImageView()
        pv.layer.borderWidth = 0.5
        pv.layer.masksToBounds = false
        pv.layer.borderColor = UIColor.clear.cgColor
        pv.layer.cornerRadius = 20
        pv.clipsToBounds = true
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        return pv
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpConstraints()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(imageIcon)
        addSubview(sideBarSegueLabel)
        
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpConstraints(){
        
        imageIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sideBarSegueLabel.leftAnchor.constraint(equalTo: imageIcon.rightAnchor, constant: 20).isActive = true
        sideBarSegueLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sideBarSegueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sideBarSegueLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    
    
    
    
    
    
    
    
    
}
