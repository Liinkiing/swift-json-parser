//
//  ViewController.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let event : Event = try! DataMapper.instance.getElement(withId: 8)!
        let place : Place = try! DataMapper.instance.getElement(withId: 9)!
        let category : Category = try! DataMapper.instance.getElement(withId: 9)!
        print(category)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

