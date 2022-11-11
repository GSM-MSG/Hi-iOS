//
//  ViewController.swift
//  HB ( made by Park Gun Woo )
//
//  Created by GSM02 on 2022/11/09.
//

import Foundation
import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    var tFCheck: Bool = false
    
    let studentNameTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "실명을 입력해주세요!"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    let welcomeUILabel = UILabel().then {
        $0.text = "처음이신가요?"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    let subWelcomeUILabel = UILabel().then {
        $0.text = "HI에 오신 걸 환영해요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    let nameExplainUILabel = UILabel().then {
        $0.text = "이름을 알려주실래요?"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    let nextStepUIButton = UIButton().then {
        $0.setTitle("다음 단계로 가볼까요?", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside) //함수 () 쓰지 않아도 되네 매개 변수 있는데
    }
 
    let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
        
        defaultSetting()
        
    }
    
    func defaultSetting() {
        view.backgroundColor = .white
        view.addSubviews(welcomeUILabel, subWelcomeUILabel, nameExplainUILabel, studentNameTextField, nextStepUIButton, underLineView)
        autolayoutSetting()
    }
    
    func autolayoutSetting() {
        self.welcomeUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(87)
            make.leading.equalTo(self.view).offset(16)
        }
        self.subWelcomeUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.welcomeUILabel.snp.bottom)
            make.leading.equalTo(self.welcomeUILabel.snp.leading).inset(1)
        }
        self.nameExplainUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.subWelcomeUILabel.snp.bottom).offset(123)
            make.leading.equalTo(self.view).offset(20)
        }
        self.studentNameTextField.snp.makeConstraints{ (make) in
            make.top.equalTo(self.nameExplainUILabel.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).inset(24)
        }
        self.nextStepUIButton.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        self.underLineView.snp.makeConstraints{ (make) in
            make.top.equalTo(studentNameTextField.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).inset(20)
            make.height.equalTo(2)
        }
    }
    
    @objc func aftercomplete(_ sender: UIButton){
        if tFCheck == true {
            let vc = SecondSUViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if studentNameTextField.text?.count ?? 0 >= 1{
            nextStepUIButton.backgroundColor = UIColor(rgb: 0xFFC033)
            tFCheck = true
        }
        else {
            nextStepUIButton.backgroundColor = UIColor(rgb: 0x999999)
            tFCheck = false
        }
    }
}
