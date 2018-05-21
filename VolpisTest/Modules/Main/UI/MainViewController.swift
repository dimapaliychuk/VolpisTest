//
//  MainViewController.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var showOnMapButton: UIButton!
    
    
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
        
    }
    
}


extension MainViewController: MainPresenterToViewProtocol {
    
    
}


// MARK: tabelView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTabelViewCell", for: indexPath) as! MainTableViewCell
        
        return cell
    }
    
}

