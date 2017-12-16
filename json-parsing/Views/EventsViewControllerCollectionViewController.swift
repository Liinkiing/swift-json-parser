//
//  EventsViewControllerCollectionViewController.swift
//  json-parsing
//
//  Created by Jbara Omar on 16/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

@IBDesignable
class EventsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "EventCell"
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let events = DataMapper.instance.events

    override func viewDidLoad() {
        collectionView?.delegate = self
        let place: Place? = DataMapper.instance.getElement(withId: 1)
        let eventsByPlace = events.findBy(place: place!)
        let eventsByCategory = events.findBy(category: DataMapper.instance.categories.first!)
        print(eventsByCategory)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let event = events[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventsCollectionViewCell
        cell.imageView.image = event.getUIImage()
        cell.labelTitle.text = event.name
        cell.labelDate.text = "Commence le \(event.startingDate.getDate(withFormat: "dd MMM YYYY, à H:mm"))"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


