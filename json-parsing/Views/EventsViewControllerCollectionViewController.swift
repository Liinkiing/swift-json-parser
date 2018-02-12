//
//  EventsViewControllerCollectionViewController.swift
//  json-parsing
//
//  Created by Jbara Omar on 16/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

@IBDesignable
class EventsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    private let reuseIdentifier = "EventCell"
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var events: [Event]? = DataMapper.instance.events
    private let normalImage = #imageLiteral(resourceName: "star_stroke")
    private let selectedImage = #imageLiteral(resourceName: "star_fill")
    private var favorites : [Event] = []

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        collectionView?.delegate = self
        searchField?.delegate = self
        favorites = DataMapper.instance.getSavedFavorites()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let width = self.view.frame.size.width;
        return CGSize(width: width-40, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }

    @IBAction func tapFav(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let currentCell = collectionView?.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! EventsCollectionViewCell
        let event = DataMapper.instance.events.findBy(id: currentCell.eventId!) as! Event
        if !sender.isSelected {
            favorites = favorites.filter { e in
                e.id != event.id}
        } else {
            favorites.append(event)
        }
        DataMapper.instance.save(favorites: favorites)
        print(DataMapper.instance.getSavedFavorites())
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventsCollectionViewCell
        guard let event = events?[indexPath.row] else { return cell }
        cell.eventId = event.id
        cell.imageView.image = event.getUIImage()
        cell.favButton.tag = indexPath.row
        cell.favButton.setImage(normalImage, for: .normal)
        cell.favButton.setImage(selectedImage, for: .selected)
        cell.favButton.isSelected = (favorites.filter { e in return e.id == event.id }).count > 0
        cell.labelTitle.text = event.name
        cell.labelDate.text = "Commence le \(event.startingDate.getDate(withFormat: "dd MMM YYYY, à H:mm"))"
        return cell
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


