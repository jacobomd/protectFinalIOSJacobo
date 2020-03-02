//
//  TopicsViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 27/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var table: UITableView!
    
    //MARK: - Propierties
    let viewModel : TopicsViewModel
    var topics : [Topic] = []
    
    
    //MARK: - Inits
    init(viewModel: TopicsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        let cell = UINib(nibName: "TopicCell", bundle: nil)
        table.register(cell, forCellReuseIdentifier: "TopicCell")
        
        viewModel.viewDidLoad()
    }

    
    @IBAction func buttonSearch(_ sender: Any) {
        print("botón de lupa pulsada")
    }
    
    @IBAction func buttonAddTopic(_ sender: Any) {
        print("botón de añadir topic nuevo pulsado")
    }
    
    
    @IBAction func buttonLogin(_ sender: Any) {
        let vc = UserSignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("pulsadoooooooo")
    }
    
}


//MARK: - Extensions
extension TopicsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = table.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
            as? TopicCell else {
                return UITableViewCell()
        }
        
        let title = topics[indexPath.row].title
        let numVisitas = topics[indexPath.row].views
        let numComents = topics[indexPath.row].postsCount
        let dateTopic = topics[indexPath.row].createdAt!
        
        cell.configure(title: title, numVisitas: "\(numVisitas)", numComents: "\(numComents)", dateTopic: "\(dateTopic)")
        
        return cell
    }
    
    
}

extension TopicsViewController: UITableViewDelegate {
    
}

//MARK: - ViewModel Comunication
protocol TopicsViewControllerProtocol: class {
    func showListTopics (topics: [Topic])
    func showError (message: String)
}

extension TopicsViewController: TopicsViewControllerProtocol {
    
    func showListTopics(topics: [Topic]) {
        self.topics = topics
        table.reloadData()
    }
   
    func showError(message: String) {
        print("Errorrrrr")
    }
}
