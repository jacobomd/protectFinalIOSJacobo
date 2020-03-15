//
//  CreateTopicViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    
    let viewModel: CreateTopicsViewModel
    var topics: AddNewTopicResponse?
    
    var textTitle: String?
    var textDescription: String?
    
    init(viewModel: CreateTopicsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.placeholder = "Insert a title"
        txtDescription.placeholder = "Insert a description ..."

        //self.title = "Crear topics"
    }


    @IBAction func butCrear(_ sender: Any) {
        textTitle = txtTitle.text
        textDescription = txtDescription.text
        
        if (txtTitle.text!.count < 15) {
            showPustTopicAlert(message: "Insert more than 15 characters in title")
        }else if (txtDescription.text!.count < 20) {
            showPustTopicAlert(message: "Insert more than 20 characters in description")
        }else {
            viewModel.didTapInTopic(title: textTitle!, raw: textDescription!)
            txtTitle.text = ""
            txtDescription.text = ""
        }
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
        //AQUI ENSEÑAMOS ALERTA
        showPustTopicAlert(message: "An error occurred while creating the topic")
    }
    
}

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
