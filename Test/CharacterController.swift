import UIKit

class CharacterController: UIViewController {
    
    //전체 모델 데이터
    let characters:[Character] = [
        Character(name:"스폰지밥",image: #imageLiteral(resourceName: "스폰지밥"), gender: "남자", country:"미국"),
        Character(name:"뚱이",image: #imageLiteral(resourceName: "뚱이"), gender: "남자", country:"미국"),
        Character(name:"징징이",image: #imageLiteral(resourceName: "징징이"), gender: "남자", country:"미국"),
        Character(name:"플랭크톤",image: #imageLiteral(resourceName: "플랑크톤"), gender: "남자", country:"미국"),
        Character(name:"퐁퐁여사",image: #imageLiteral(resourceName: "퐁퐁부인"), gender: "여자", country:"미국")
    ]
    //캐릭터뷰
    @IBOutlet weak var characterView: CharacterView!
    //현재 인덱스
    var index:Int = 0
    //현재 모델 데이터
    var character:Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        notifyFromView()
    }
    
    //모델과 뷰 초기화
    func configure() {
        character = characters[index]
        updateView()
    }
    //뷰로부터 이전버튼과 다음버튼에 인터랙션을 전달받음
    func notifyFromView() {
        characterView.nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        
        characterView.previousButton.addTarget(self, action: #selector(previousButtonTapped(_:)), for: .touchUpInside)
    }
    //다음버튼이 눌렸다면
    @objc func nextButtonTapped(_ sender: UIButton) {
       //다음 캐릭터로 업데이트
       updateNextCharacter()
        //뷰에게 업데이트 하라고 지시
        updateView()
    }
    //이전 버튼이 눌렸다면
    @objc func previousButtonTapped(_ sender: UIButton) {
        //이전 캐릭터로 업데이트
       updatePreviousCharacter()
        //뷰에게 업데이트 하라고 지시
        updateView()
    }
    //뷰를 업데이트하라고 지시
    @objc func updateView() {
        //캐릭터 뷰의 캐릭터를 현재 캐릭터로 바꿈.
        characterView.updateView(character: character)
    }
    //다음 캐릭터로 업데이트
    func updateNextCharacter() {
        if index < 4 {
            index += 1
            character = characters[index]
        }
    }
    //이전 캐릭터로 업데이트
    func updatePreviousCharacter() {
        if index > 0 {
            index -= 1
            character = characters[index]
        }
    }
}
