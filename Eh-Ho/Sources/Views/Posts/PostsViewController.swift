//
//  PostsViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit


class PostsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableViewPosts: UITableView!
    
    //MARK: - Propierties
    var posts : [Post2] = []
    let viewModel : PostViewModel
    var id: Int = 0

    //MARK: - Inits
    init(viewModel : PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - RefreshControl
    lazy var refreshControl:UIRefreshControl = {
        let refresControl = UIRefreshControl()
        //QUE AL CAMBIAR EL VALOR, SE EJECUTE UN MÉTODO
        refresControl.addTarget(self, action: #selector(PostsViewController.actualizarDatos(_:)), for: .valueChanged)
        //ESTABLECER EL COLOR DE LA RULETILLA
        refresControl.tintColor = UIColor.blue
        return refresControl
    }()
    
    @objc func actualizarDatos(_ refresControl: UIRefreshControl){
        //AQUI TU TIENES QUE ACTUALIZAR TUS DATOS. TU DATASOURCE. LLAMAR A TU SERVIDOR, VOLVER A TRAER LOS DATOS. ELIMINAR O AÑADIR AL ELEMENTO PERSISTIDO
        viewModel.viewDidLoad()
        //REFRESCO LA VISTA DE TABLA
        self.tableViewPosts.reloadData()
        //PARO EL REFRESH CONTROL
        refresControl.endRefreshing()
        
    }
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableViewPosts.dataSource = self
        tableViewPosts.delegate = self
        
        tableViewPosts.rowHeight = UITableView.automaticDimension
        tableViewPosts.estimatedRowHeight = PostCell.estimateRowHeight()
        let cellPost = UINib(nibName: "PostCell", bundle: nil)
        tableViewPosts.register(cellPost, forCellReuseIdentifier: "PostCell")
        self.tableViewPosts.tableFooterView = UIView()
        
        self.title = "Posts"
        viewModel.viewDidLoad()
        setupUI()
        tableViewPosts.refreshControl = refreshControl
      
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //createView()
    }
    
    
    //MARK: - UI
    func setupUI() {
        
        let backItem = UIBarButtonItem()
        backItem.title = "posts"
        let colorOrange = UIColor.systemOrange
        let colorBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        backItem.tintColor = colorBlack
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.barTintColor = colorOrange
                
        let createMessag = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(createMessage))
        createMessag.tintColor = colorBlack
        createMessag.image = UIImage(named: "message")
        
        // Add button
        navigationItem.rightBarButtonItems = [createMessag]
        
        
    }
    
    //MARK: - Navigation
    @objc func createMessage() {
        
        if CheckInternet.Connection() {
            if Session.loggedSession() {
                viewModel.didTapInTopic(id: self.id)
            } else {
                showCreatePostAlert(message: "You have to be logged in to perform this action")
            }
        } else {
            showCreatePostAlert(message: "You need to have an internet connection to carry out the action")
        }
    }
    
    //MARK: - Private functions
    private func convertDateFormater(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            
        }
        
        dateFormatter.dateFormat = " MMM dd, yyyy "
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
        
    }
    
    private func showCreatePostAlert(message: String)  {
        //Create the alert
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        //Creamos la accion
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        //Aañadimos a la alerta
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

//MARK: - Extensions

extension PostsViewController: UITableViewDataSource {
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        if tableView == tableViewPosts {
            count =  posts.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellFinal: UITableViewCell?
        
        if (tableView == self.tableViewPosts) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
                else { return UITableViewCell()
            }
            
                var resultado = posts[indexPath.row].cooked
                resultado = resultado.replacingOccurrences(of: "<p>", with: "", options: NSString.CompareOptions.literal, range: nil).capitalizingFirstLetter()
                resultado = resultado.replacingOccurrences(of: "</p>", with: "", options: NSString.CompareOptions.literal, range: nil).capitalizingFirstLetter()
                
                // cell.textLabel?.text = resultado
                id = posts[indexPath.row].topicID
 
            
                let userName = posts[indexPath.row].username
                let descripcion = resultado
                //let avatar = posts[indexPath.row].avatarTemplate
                //let avatarImage = UIImage(named: "https://mdiscourse.keepcoding.io/\(avatar)")
                let avatarImage = UIImage(named: "cell_usuario")
                
                let date = posts[indexPath.row].createdAt
                
                let dateUpDate =  convertDateFormater(date: date)
                
                cell.configure(avatarImage: avatarImage!, userName: userName,descripcion: descripcion,
                               date: dateUpDate)
                
            cellFinal = cell
            
        }
       
        return cellFinal!
    }
    
}

extension PostsViewController: UITableViewDelegate {
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}



// MARK: - ViewModel Communication
protocol PostsViewControllerProtocol: class {
    func showListPostssByTopic(posts: [Post2])
    func showError(with message: String)
}


extension PostsViewController: PostsViewControllerProtocol {
    
    func showListPostssByTopic(posts: [Post2]) {
        self.posts = posts
        self.tableViewPosts.reloadData()
    }
    
    func showError(with message: String) {
        //AQUI ENSEÑAMOS ALERTA
        print("ERROR")
    }

}
