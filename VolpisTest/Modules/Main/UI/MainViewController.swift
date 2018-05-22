//
//  MainViewController.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation

class MainViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var showOnMapButton: UIButton!
    fileprivate var places: [Place]?
    
    
    // MARK: dependencies
    
    var presenter: MainViewToPresenterProtocol!
    
    
    // MARK: life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainAssembly.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: private
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "objects".localized.uppercased()
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor.customGreen()
        showOnMapButton.backgroundColor = UIColor.customGreen()
        showOnMapButton.setTitleColor(UIColor.white, for: .normal)
        showOnMapButton.setTitle("show_on_map".localized.uppercased(), for: .normal)
    }
    
    
    // MARK: action
    
    @IBAction func showOnMapButtonAction(_ sender: Any) {
        guard let places = places else {
            return
        }
        var selectedPlaces = [Place]()
        for item in places {
            if item.isSelected {
                selectedPlaces.append(item)
            }
        }
        presenter.showOnMap(with: selectedPlaces)
    }
    
}


extension MainViewController: MainPresenterToViewProtocol {
    
    func showPlaces(places: [Place]) {
        self.places = places
        tableView.reloadData()
    }
}


// MARK: tabelView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTabelViewCell", for: indexPath) as! MainTableViewCell
        guard let places = places else {
            return cell
        }
        
        if let url = places[indexPath.row].imageUrl {
            cell.placeImageView.sd_setImage(with: URL(string: url)) { (image, error, cacheType, url) in
                cell.placeImageView.image = image
            }
        }
        cell.checkImageView.image = places[indexPath.row].isSelected ? #imageLiteral(resourceName: "select") : #imageLiteral(resourceName: "unselect")
        cell.nameLabel.text = places[indexPath.row].title
        cell.descriptionLabel.text = places[indexPath.row].description
        if let distanse = places[indexPath.row].distanse {
            cell.distanceLabel.text = String(format: "%.1f " + "km".localized, distanse.inKilometers())
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let place = places?[indexPath.row] else {
            return
        }
        place.isSelected = !place.isSelected
        let cell = tableView.cellForRow(at: indexPath) as! MainTableViewCell
        cell.checkImageView.image = place.isSelected ? #imageLiteral(resourceName: "select") : #imageLiteral(resourceName: "unselect")
    }
    
}

