//
//  ThirdSUViewController.swift
//  Hi_MSG
//
//  Created by GSM02 on 2022/11/11.
//

import UIKit

class ThirdSUViewController: BaseViewController {

    var nextStep: Bool = false

    let passwordTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    let passwordCheckTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let welcomeLabel = UILabel().then {
        $0.text = "비밀번호 만들기"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    let subWelcomeLabel = UILabel().then {
        $0.text = "아무도 모를 비밀번호를 만들어주세요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    let emailExplainLabel = UILabel().then {
        $0.text = "비밀번호를 알려주세요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    let passwordExplainLabel = UILabel().then {
        $0.text = "다시 한 번 말해주실래요?"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    let nextStepButton = UIButton().then {
        $0.setTitle("회원가입 하기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside) //함수 () 쓰지 않아도 되네 매개 변수 있는데
    }

    let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    let underLine2View = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    override func addView() {
        view.addSubviews(welcomeLabel, subWelcomeLabel, emailExplainLabel, passwordExplainLabel, passwordTextField, passwordCheckTextField, nextStepButton, underLineView, underLine2View)
    }
    
    override func setLayout() {
        self.welcomeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(87)
            make.leading.equalTo(self.view).offset(16)
        }
        
        self.subWelcomeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.welcomeLabel.snp.bottom)
            make.leading.equalTo(self.welcomeLabel.snp.leading).inset(1)
        }
        
        self.emailExplainLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.subWelcomeLabel.snp.bottom).offset(123)
            make.leading.equalTo(self.view).offset(20)
        }
        
        self.passwordExplainLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.underLineView.snp.bottom).offset(32)
            make.leading.equalTo(self.view).offset(21)
        }
        
        self.passwordTextField.snp.makeConstraints{ (make) in
            make.top.equalTo(self.emailExplainLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).inset(24)
        }
      
        self.passwordCheckTextField.snp.makeConstraints{ (make) in
            make.top.equalTo(self.passwordExplainLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).inset(24)
        }
        
        self.nextStepButton.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        self.underLineView.snp.makeConstraints{ (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).inset(20)
            make.height.equalTo(2)
        }
        
        self.underLine2View.snp.makeConstraints{ (make) in
            make.top.equalTo(self.passwordCheckTextField.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).inset(20)
            make.height.equalTo(2)
        }
    }

    @objc func aftercomplete(_ sender: UIButton){
        if nextStep == true {
            print("회원가입 성공")
            navigationController?.popToRootViewController( animated: false )
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if passwordCheckTextField.text == passwordTextField.text && passwordTextField.text?.count ?? 0 >= 8{
            nextStepButton.backgroundColor = UIColor(rgb: 0xFFC033)
            nextStep = true
        }
        else {
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
            nextStep = false
        }
    }
}
