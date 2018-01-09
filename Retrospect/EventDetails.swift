//
//  EventDetails.swift
//  Retrospect
//
//  Created by Shivam Dave on 12/14/17.
//  Copyright © 2017 ShivamDave. All rights reserved.
//

import UIKit
import Foundation


class EventDetails: NSObject{
    
    var date: String?
    var text: String?
    var image: UIImage?
    
    init(date: String, text: String, image: UIImage?) {
        self.date = date
        self.text = text
        self.image = image
    }
    
}
