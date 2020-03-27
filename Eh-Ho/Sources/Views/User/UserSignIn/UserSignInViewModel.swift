//
//  UserSignInViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class UserSignInViewModel {
    
    //MARK: - Propiesties
    weak var view : UserSignInViewControllerProtocol?
    let router : UserSignInRouter
    let signInRepository : LoginSignUpRepository
   
    //MARK: - Inits
    init(router: UserSignInRouter, signInRepository : LoginSignUpRepository) {
        self.router = router
        self.signInRepository = signInRepository
    }
    
    //MARK: - Public functions
    func didTapInSignIn(userName: String, password: String) {
        signInUser(userName: userName, password: password)
    }
    
    func didTapInPasswReset(login: String) {
        passwordReset(login: login)
    }
    
    func navigateToTopics() {
        router.navigateToTopicList()
    }
    
    //MARK: - Private functions
    private func signInUser(userName: String, password: String) {
        signInRepository.signInUser(userName: userName, password: password) {
            [weak self] result in
            switch result {
            case .success(let value):
                self?.view?.showUserLogged(value: value.user.name)
                Session.saveSession(userName: value.user.username)
            case .failure(let error):
                self?.view?.showErrorUserLogged(error: error.errors.joined(separator: ","))
            }
        }
    }
    
    private func passwordReset(login: String) {
        signInRepository.passwordReset(login: login) {
            [weak self] result in
            switch result {
            case .success(let value):
                if value.userFound == false {
                    self?.view?.showPasswReset(valueResult: value.result ?? "Incorrect username or mail.")
                } else {
                self?.view?.showPasswReset(valueResult: "We found an account that matches the username \(login), you should receive an mail with instructions on how to reset your password shorty.")
                }
                
            case .failure(let error):
                self?.view?.showErrorUserLogged(error: error.errors.joined(separator: ","))
            }
        }
    }
}
