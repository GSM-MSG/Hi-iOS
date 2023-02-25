import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

class NoticeContentsViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    private let title_notice = UILabel().then {
        $0.font = .hi_MSG(size: 24, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.text = "공지사항"
    }
    
    private let contents_notice = UIView().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let title_contents = UILabel().then {
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.text = "12/20(화) 홈베이스 이용 공지"
    }
    
    private let time_that_moment_contents = UILabel().then {
        $0.text = "2022.12.20 11:00"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_contents = UILabel().then {
        $0.text = "이명규T"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let text_contents = UILabel().then {
        $0.text = "Sample Text\n다람쥐 쳇바퀴에 굴러간다"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .hi_MSG(size: 20, family: .semiBold)
        $0.numberOfLines = 0
    }
    
    private let optionButton = UIButton().then {
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = UIColor(rgb: 0x212121)
        $0.addTarget(self, action: #selector(option), for: .touchUpInside)
    }
    
    private let noticeUpdateButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x000000)
        $0.alpha = 0.5
        $0.setTitle("공지 수정", for: .normal)
        $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xD9D9D9), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .regular)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        $0.tintColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 13
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.isHidden = true
        $0.addTarget(self, action: #selector(update), for: .touchUpInside)
    }
    
    private let noticeDeleteButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x000000)
        $0.alpha = 0.5
        $0.setTitle("공지 삭제", for: .normal)
        $0.setImage(UIImage(systemName: "trash"), for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xD9D9D9), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .regular)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        $0.tintColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 13
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete11), for: .touchUpInside)
    }
    
    private let back_contents_button = UIButton().then {
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 14, family: .medium)
        $0.setTitle("-탭해서 뒤로가기-", for: .normal)
        $0.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        let HI_LOGO_2 = UIImage(named: "HI_LOGO_2")
        let leftButtonItem = UIBarButtonItem(image: HI_LOGO_2, style: .plain, target: self, action: nil)
        leftButtonItem.tintColor = UIColor(rgb: 0xFFC033)
        navigationItem.leftBarButtonItem = leftButtonItem
        
        
        let largeFont = UIFont.systemFont(ofSize: 100)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        
        let person_circle = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)
        
        let rightButtonItem = UIBarButtonItem(image: person_circle, style: .plain, target: self, action: nil)
        //        rightButtonItem.width = 16
        rightButtonItem.tintColor = UIColor(rgb: 0xD9D9D9)
        
        let largeFont1 = UIFont.systemFont(ofSize: 15)
        let configuration1 = UIImage.SymbolConfiguration(font: largeFont1)
        
        let bell_badge = UIImage(systemName: "bell.badge.fill", withConfiguration: configuration1)
        
        let rightButtonItem2 = UIBarButtonItem(image: bell_badge, style: .plain, target: self, action: nil)
        //        rightButtonItem2.width = 16
        rightButtonItem2.tintColor = UIColor(rgb: 0x4D4D4D)
        //        rightButtonItem2.tintColor = UIColor(rgb: 0xFFB001)
        
        navigationItem.rightBarButtonItems = [rightButtonItem2, rightButtonItem]
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
          tapGesture.delegate = self
               
          self.view.addGestureRecognizer(tapGesture)
    }

    override func addView() {
        view.addSubviews(
            title_notice,
            contents_notice,
            title_contents,
            time_that_moment_contents,
            from_contents,
            text_contents,
            back_contents_button,
            optionButton,
            noticeUpdateButton,
            noticeDeleteButton
        )
    }
    
    override func setLayout() {
        self.title_notice.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.contents_notice.snp.makeConstraints {
            $0.top.equalTo(self.title_notice.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(496)
        }
        self.title_contents.snp.makeConstraints {
            $0.top.equalTo(self.contents_notice.snp.top).inset(8)
            $0.leading.equalTo(self.contents_notice.snp.leading).inset(16)
        }
        self.time_that_moment_contents.snp.makeConstraints {
            $0.top.equalTo(self.title_contents.snp.bottom).offset(4)
            $0.leading.equalTo(self.contents_notice.snp.leading).inset(16)
        }
        self.from_contents.snp.makeConstraints {
            $0.top.equalTo(self.contents_notice.snp.top).inset(55)
            $0.trailing.equalTo(self.contents_notice.snp.trailing).inset(16)
        }
        self.text_contents.snp.makeConstraints {
            $0.top.equalTo(self.from_contents.snp.bottom).offset(59)
            $0.leading.equalTo(self.contents_notice).offset(16)
        }
        self.back_contents_button.snp.makeConstraints {
            $0.bottom.equalTo(self.contents_notice.snp.bottom).inset(8)
            $0.centerX.equalToSuperview()
        }
        self.optionButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.trailing.equalTo(self.view).inset(20)
        }
        self.noticeUpdateButton.snp.makeConstraints {
            $0.top.equalTo(self.optionButton.snp.bottom).offset(16)
            $0.trailing.equalTo(self.view).inset(12)
            $0.height.equalTo(48)
            $0.width.equalTo(160)
        }
        self.noticeDeleteButton.snp.makeConstraints {
            $0.top.equalTo(self.noticeUpdateButton.snp.bottom)
            $0.trailing.equalTo(self.view).inset(12)
            $0.height.equalTo(48)
            $0.width.equalTo(160)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        noticeUpdateButton.isHidden = true
        noticeDeleteButton.isHidden = true
            self.view.endEditing(true)
            return true
        }
    
    @objc private func back(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func option(_ sender: UIButton){
        noticeUpdateButton.isHidden = false
        noticeDeleteButton.isHidden = false
    }
    
    @objc private func update(_ sender: UIButton){
        print("수정 화면으로 가기")
    }
    
    @objc private func delete11(_ sender: UIButton){
        let completed = UIAlertController(title: "공지글 삭제", message: "글을 삭제하면 복구할 수 없어요!\n 정말 삭제하실 건가요?", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "취소", style: .default){_ in
        })
        completed.addAction(UIAlertAction(title: "삭제", style: .default){_ in 
            print("삭제 하기")
            self.navigationController?.popViewController(animated: true)
        })
        present(completed, animated: true, completion: nil)
    }
}

