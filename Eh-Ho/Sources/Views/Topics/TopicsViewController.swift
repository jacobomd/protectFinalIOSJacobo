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
        setupUI()
        let cell = UINib(nibName: "TopicCell", bundle: nil)
        table.register(cell, forCellReuseIdentifier: "TopicCell")
        viewModel.viewDidLoad()
    }
    
    //MARK: - UI
    func setupUI() {
        
        self.title = "Topics"
        let backItem = UIBarButtonItem()
        backItem.title = "topics"
        let color = UIColor(red: 291/255, green: 99/255, blue: 0/255, alpha: 1.0)
        backItem.tintColor = color
        navigationItem.backBarButtonItem = backItem
        
        let searchTopic = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(displaySearch))
        searchTopic.tintColor = color
        searchTopic.image = UIImage(named: "temas_Search")
        
        let userLogin = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(displayLogin))
        userLogin.tintColor = color
        userLogin.image = UIImage(named: "tabBar_usuarioOn")
        
        navigationItem.rightBarButtonItems = [searchTopic, userLogin]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24)!]
        
    }
    
    //MARK: - Navigations

    @IBAction func buttonAddTopic(_ sender: Any) {
        print("botón de añadir topic nuevo pulsado")
    }
    
    @objc func displayLogin () {
        showViewLogin()
    }
    
    @objc func displaySearch () {
        print("lupa pulsadaaaaaaaaaa")
    }
    
    //MARK: - Privates functions
    private func  showViewLogin() {
        let vc = UserSignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
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
