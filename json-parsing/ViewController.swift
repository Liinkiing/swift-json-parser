//
//  ViewController.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let event : Event = DataMapper.instance.getElement(withId: 8)!
        let place : Place = DataMapper.instance.getElement(withId: 9)!
        let category : Category = DataMapper.instance.getElement(withId: 1)!
        print(event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

