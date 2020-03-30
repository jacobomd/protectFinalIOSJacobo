//
//  CreateTopicViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class CreateTopicViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    //MARK: - Properties
    let viewModel: CreateTopicsViewModel
    var topics: AddNewTopicResponse?
    var textTitle: String?
    var textDescription: String?
    
    //MARK: - Inits
    init(viewModel: CreateTopicsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.title = "Create topic"
    }
    
    //MARK: - UI
    private func setUI() {
        let backItem = UIBarButtonItem()
        backItem.title = "topics"
        
        let colorOrange = UIColor.systemOrange
        let colorBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        backItem.tintColor = colorBlack
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.barTintColor = colorOrange
        let createdNewPost = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addNewPost))
        createdNewPost.tintColor = colorBlack
        createdNewPost.image = UIImage(named: "navigation")
        
        // Add button
        navigationItem.rightBarButtonItems = [createdNewPost]
    }
    
    //MARK: - Navigations
    @objc func addNewPost() {
        textTitle = txtTitle.text
        textDescription = txtDescription.text

        viewModel.didTapInTopic(title: textTitle!, raw: textDescription!)
        txtTitle.text = ""
        txtDescription.text = ""
    }

}

//MARK: - VIEWMODEL COMMUNICATION
protocol CreateTopicsViewControllerProtocol: class {
    
    func createNewTopic()
    func showError(with message: String)
}

extension CreateTopicViewController: CreateTopicsViewControllerProtocol {
    func createNewTopic() {
        showPustTopicAlert(message: "Topic created successfully")
    }
    
    func showError(with message: String) {
        showPustTopicAlert(message: message)
    }
    
}

//MARK: - Extensions
extension CreateTopicViewController {
    
    private func showPustTopicAlert(message: String)  {
        //Create the alert
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        //Creamos la accion
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        //Aañadimos a la alerta
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
