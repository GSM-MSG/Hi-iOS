//
//  NameViewController.swift
//  Hi_MSG
//
//  Created by 박준서 on 2022/10/27.
//

import Foundation
import UIKit
import SnapKit
import Then

class FirstSignup: UIViewController {
    
    let firstUILabel = UILabel().then{
        $0.text = "처음이신가요?"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    let welcomeUILabel = UILabel().then{
        $0.text = "Hi에 오신 걸 환영해요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    let nameUILabel = UILabel().then{
        $0.text = "이름을 알려주실래요?"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }

    let nameTextField = UITextField().then{
        $0.placeholder = "실명을 입력해주세요"
        $0.font = UIFont(name: "Pretendard-Regular", size: 17)
        $0.textColor = UIColor(rgb: 0x999999)
    }

    let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }

    let nextStepButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.setTitle("다음 단계로 가볼까요?", for: .normal)
        
        
        
    }
    
    override func viewDidLoad() {
        
        view.addSubViews(firstUILabel, welcomeUILabel, nameUILabel, nameTextField, underLineView, nextStepButton)
        
        view.backgroundColor = .white
        
        firstUILabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(161)
            $0.top.equalTo(view.snp.top).offset(88)
            $0.bottom.equalTo(view.snp.bottom).inset(683)

        }
        welcomeUILabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(217)
            $0.top.equalTo(view.snp.top).offset(129)
            $0.bottom.equalTo(view.snp.bottom).inset(664)
            
        }
        nameUILabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().offset(251)
            $0.top.equalTo(view.snp.top).offset(268)
            $0.bottom.equalTo(view.snp.bottom).inset(530)
            
        }
        nameTextField.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(214)
            $0.top.equalTo(view.snp.top).offset(296)
            $0.bottom.equalTo(view.snp.bottom).inset(496)
        }
        underLineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(nameTextField.snp.bottom).offset(3)
            $0.height.equalTo(2)
        }
        nextStepButton.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(732)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(80)
            
        }
    }
    
   
}
