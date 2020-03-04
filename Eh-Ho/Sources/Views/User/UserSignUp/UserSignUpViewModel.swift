//
//  UserSignUpViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class UserSignUpViewModel {
    
    //MARK: - Propierties
    weak var view : UserSignUpViewControllerProtocol?
    let router : UserSignUpRouter
    let signUpRepository: LoginSignUpRepository
    
    //MARK: - Inits
    init(router: UserSignUpRouter, signUpRepository: LoginSignUpRepository) {
        self.router = router
        self.signUpRepository = signUpRepository
    }
    
    //MARK: - Public functions
    func didTapInSignUp(email: String, name: String, userName: String, password: String) {
        createUserAcount(email: email, name: name, userName: userName, password: password)
        
    }
    
    func navigateToTopics() {
        router.navigateToTopicList()
    }
    
    //MARK: - Private functions
    private func createUserAcount(email: String, name: String, userName: String, password: String) {
        
        signUpRepository.createUserAccount(email: email, name: name, userName: userName, password: password) {
            [weak self] result in
            switch result {
            case .success( _):
                self?.view?.showUserCreated()
            case .failure(let error):
                self?.view?.showErrorUserCreated(message: error.errors.joined(separator: ","))
            }
        }
        
    }
}
