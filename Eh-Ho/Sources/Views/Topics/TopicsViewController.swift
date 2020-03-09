//
//  TopicsViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 27/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit
import PopupDialog

class TopicsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var butNewTopic: UIButton!
    
    //MARK: - Propierties
    let viewModel : TopicsViewModel
    var topics : [Topic] = []
    var users : [User] = []
    var listMessagPriv: [TopicMessagePrivateUser] = []
    var detailUser : LoginUser?
    var avartars : String = ""
        
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
        
        if Session.loggedSession() { // Si estas logueado
        userLogin.image = UIImage(named: "logOut")
        } else { // No estas logueado
            userLogin.image = UIImage(named: "tabBar_usuarioOn")
            self.butNewTopic.isHidden = true
        }
        
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
        if Session.loggedSession() {
            showUserLogOutAlert(message: "Do you want to leave the session?")
            table.reloadData()
        } else {
        let vc = UserSignInRouter.configureModule()
        navigationController?.pushViewController(vc, animated: true)
        //let navVc = UINavigationController(rootViewController: vc)
        //self.present(navVc, animated: true, completion: nil)
        }
    }
    
    private func showUserLogOutAlert (message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel) { _ in
            self.showSpinner(onView: self.view)
            Session.logOutSession()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.removeSpinner()
                self.navigationItem.rightBarButtonItems?[1].image = UIImage(named: "tabBar_usuarioOn")
                self.butNewTopic.isHidden = true
            })
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private  func showCustomDialog(animated: Bool = true) {

        // Create a custom view controller
        let detailUserVC = DeatilUserViewController(nibName: "DeatilUserViewController", bundle: nil)
          

        
        // Create the dialog
        let popup = PopupDialog(viewController: detailUserVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                preferredWidth:  340,
                                tapGestureDismissal: true,
                                panGestureDismissal: false
                                )
        
        // Avatar
        guard let avatar = detailUser?.avatarTemplate else {return}
        let avatarFinal = avatar.replacingOccurrences(of: "{size}", with: "130")
        let imagAvatar = "https://mdiscourse.keepcoding.io/\(avatarFinal)"
        
        // UserName
        guard let labelUsername =  detailUser?.username else {return}
        
        // Name
        guard let labelName =  detailUser?.name else {return}
        
        // Status moderator
        var labelStatusModerator = "nulo"
        if detailUser?.moderator == true {
              labelStatusModerator = "Yes"
        } else {
              labelStatusModerator = "No"
        }
        
        // Last session
        guard let labelLastSeen =  detailUser?.lastSeenAt else {return}
        let labelLastSeenFormater = convertDateFormater(date: labelLastSeen)
        
        // Number privates messages
        let labelMessPriva = listMessagPriv.count.description
        
        
        detailUserVC.configure(avatar: imagAvatar, username: labelUsername, name: labelName, statusModerator: labelStatusModerator, lastSeen: labelLastSeenFormater, listMessagPriv: labelMessPriva)
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
    private func convertDateFormater(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            
        }
        
        dateFormatter.dateFormat = " MMM dd "
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
        
    }
}


//MARK: - Extensions
extension TopicsViewController: UITableViewDataSource{
    
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
        
        let dateTopicFormater = convertDateFormater(date: dateTopic)
        
        let posters = topics[indexPath.row].posters
        for poster in posters {
            if poster.description.starts(with: "Original Poster") {
                let userPoster = poster.userID
                for user in users {
                    if userPoster == user.id {
                        let avatar = user.avatarTemplate
                        let avatarFinal = avatar.replacingOccurrences(of: "{size}", with: "64")
                        let image = "https://mdiscourse.keepcoding.io/\(avatarFinal)"
                        
                        cell.configure(title: title, numVisitas: "\(numVisitas)", numComents: "\(numComents)", dateTopic: "\(dateTopicFormater)", avatarUserImage: image )
                        
                        cell.actionBlock = {
                            print("PULSADO BOTON DEL AVATAR CON LA ID : \(user.username)")
                            self.viewModel.didTapAvatarUser(userName: user.username)
                           
                        }
                    } 
                }
            }
        }
        return cell
    }
}

extension TopicsViewController: UITableViewDelegate {
    
}

//MARK: - ViewModel Comunication
protocol TopicsViewControllerProtocol: class {
    func showListTopics (topics: [Topic], users: [User])
    func showListAvatarByTopic(avatar: String)
    func showDetailUser(detailUser: LoginUser)
    func showListMessagPrivUser(listMessagPriv: [TopicMessagePrivateUser])
    func showError (message: String)
}

extension TopicsViewController: TopicsViewControllerProtocol {
    
    func showListMessagPrivUser(listMessagPriv: [TopicMessagePrivateUser]) {
        self.listMessagPriv = listMessagPriv
        self.showCustomDialog()
    }
    
    
    func showDetailUser(detailUser: LoginUser) {
        self.detailUser = detailUser
        self.showCustomDialog()
    }
   
    func showListTopics(topics: [Topic], users: [User]) {
        self.topics = topics
        self.users = users
        table.reloadData()
    }
    
    func showListAvatarByTopic(avatar: String) {
        let avatarFinal = avatar.replacingOccurrences(of: "{size}", with: "40")
        avartars = avatarFinal
        table.reloadData()
    }
   
    func showError(message: String) {
        print("Errorrrrr: \(message)")
    }
}


var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

