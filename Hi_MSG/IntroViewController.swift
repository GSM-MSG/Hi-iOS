//
//  PSViewController.swift
//  Hi_MSG
//
//  Created by 박준서 on 2022/10/19.
//

import Foundation
import UIKit
import SnapKit
import Then


class IntroViewController: UIViewController{
    
    let welcomeImageView = UIImageView().then{
        $0.image = UIImage(named: "Welcome_Image")
        $0.clipsToBounds = true // 잘리는거
    }
    let welcomeUILablel = UILabel().then{
        $0.text = "반가워요!"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        
    }
    let introUILablel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x999999)
        $0.text = " Hi에서 홈베이스 신청을\n온라인으로 쉽게 해보아요!"
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }
    let loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal) // 버튼 안에 들어갈 글자
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal) //버튼 안에 들어갈 글자 색깔
        $0.backgroundColor =  UIColor(rgb: 0xFFC033)
        $0.layer.cornerRadius = 15 // 버튼 곡률 크기
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubViews(welcomeImageView,welcomeUILablel,introUILablel,loginButton)
        
        
        
        welcomeImageView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.snp.top).offset(41)
            $0.height.equalTo(360)
            
        }
        welcomeUILablel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.top.equalTo(welcomeImageView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().offset(122)
        }
        introUILablel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.top.equalTo(welcomeUILablel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().offset(82)
        }
        loginButton.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.top.equalTo(introUILablel.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(50)
        }
        
        
        
    }
    
    @objc func aftercomplete(_ sender: UIButton){
        let vc = NameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

