import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

class ResisterNoticeViewController: BaseViewController {

    lazy var rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(resisterNotice))

    private let resisterView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 20
    }
    
    private let titleTextField = UITextField().then {
        $0.placeholder = "제목"
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x999999)
        $0.borderStyle = .none
    }
    
    private let underView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    let contentsTextViewPlaceHolder = "내용을 입력하세요."
    
    lazy var contentsTextView = UITextView().then {
        $0.text = self.contentsTextViewPlaceHolder
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        rightBarButtonItem.tintColor = UIColor(rgb: 0xFFC033)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF2F2F2)
    }
    
    override func addView() {
        view.addSubviews(
            resisterView,
            titleTextField,
            underView,
            contentsTextView
        )
    }
    
    override func setLayout() {
        self.resisterView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(self.view.safeAreaLayoutGuide).inset(24)
        }
        self.titleTextField.snp.makeConstraints {
            $0.top.equalTo(self.resisterView.snp.top).inset(34)
            $0.leading.trailing.equalTo(self.resisterView).inset(16)
            $0.height.equalTo(26)
        }
        self.underView.snp.makeConstraints {
            $0.top.equalTo(self.titleTextField.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(self.titleTextField)
            $0.height.equalTo(1)
        }
        self.contentsTextView.snp.makeConstraints {
            $0.top.equalTo(self.underView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(self.resisterView).inset(16)
            $0.bottom.equalTo(self.resisterView.snp.bottom).inset(25)
        }
    }
    
    @objc private func resisterNotice(_ sender: UIButton) {
        print("공지를 등록합니다")
        navigationController?.popViewController(animated: true)
    }
}

extension ResisterNoticeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == contentsTextViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = contentsTextViewPlaceHolder
            textView.textColor = .lightGray
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        guard characterCount <= 700 else { return false }

        return true
    }
}
