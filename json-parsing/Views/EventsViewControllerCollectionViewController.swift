//
//  EventsViewControllerCollectionViewController.swift
//  json-parsing
//
//  Created by Jbara Omar on 16/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

@IBDesignable
class EventsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    private let reuseIdentifier = "EventCell"
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var events: [Event]? = DataMapper.instance.events
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        collectionView?.delegate = self
        searchField?.delegate = self
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventsCollectionViewCell
        guard let event = events?[indexPath.row] else { return cell }
        cell.eventId = event.id
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func searchValueChanged(_ sender: UITextField) {
        if sender.text == "" {
            events = DataMapper.instance.events
        } else {
            events = DataMapper.instance.events.findBy(name: sender.text!) as? [Event]
        }
        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: collectionView.cellForItem(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detail") {
            let cell = sender as! EventsCollectionViewCell
            let to = segue.destination as! DetailViewController
            let indexPath = collectionView!.indexPath(for: cell)
            let event: Event = DataMapper.instance.getElement(withId: cell.eventId!)!
            to.event = event
        }
    }
}


