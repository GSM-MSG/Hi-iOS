//
//  PSViewController.swift
//  Hi_MSG
//
//  Created by 박준서 on 2022/10/19.
//

import Foundation
import UIKit
import SnapKit

class IntroViewController: UIViewController{
    let logoImageView = UIImageView()
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubViews(logoImageView)
        view.addSubViews(loginButton)
        view.addSubViews(signupButton)
        
        
        logoImageView.image = UIImage(named: "HI_LOGO")
        logoImageView.layer.cornerRadius = 50 //사진 겉에 둥글게
        logoImageView.clipsToBounds = true // 잘리는거
        
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(-100)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        signupButton.snp.makeConstraints{
            $0.centerX.equalTo(logoImageView) //뷰에서의 X좌표의 가운데
            $0.top.equalTo(logoImageView.snp.bottom).offset(150)
            $0.width.equalTo(300) //너비 = 60
            $0.height.equalTo(50) // 높이 = 10
        }
        loginButton.snp.makeConstraints{
            $0.centerX.equalTo(signupButton) //뷰에서의 X좌표의 가운데
            $0.top.equalTo(signupButton.snp.bottom).offset(20)
            $0.width.equalTo(300) //너비 = 60
            $0.height.equalTo(50) // 높이 = 10
        }
        
        signupButton.setTitle("회원가입하기", for: .normal) // 버튼 안에 들어갈 글자
        signupButton.setTitleColor(.white, for: .normal) //버튼 안에 들어갈 글자 색깔
        signupButton.backgroundColor = .systemYellow // 버튼 색깔
        signupButton.layer.cornerRadius = 13 // 버튼 곡률 크기
        signupButton.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside)
        
        loginButton.setTitle("로그인하기", for: .normal) // 버튼 안에 들어갈 글자
        loginButton.setTitleColor(.white, for: .normal) //버튼 안에 들어갈 글자 색깔
        loginButton.backgroundColor = .systemYellow // 버튼 색깔
        loginButton.layer.cornerRadius = 13 // 버튼 곡률 크기
        
        
    }
    
    @objc func aftercomplete(_ sender: UIButton){
        let vc = NameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

