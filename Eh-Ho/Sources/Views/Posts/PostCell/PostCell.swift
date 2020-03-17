import UIKit

class PostCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    
    //MARK: - Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descripcion?.layer.cornerRadius = (descripcion?.frame.size.height)!/3.5
        descripcion?.layer.masksToBounds = true
       
    }
    
    //MARK: - Functions
    func configure(avatarImage: UIImage, userName: String, descripcion: String,  date: String) {
        
        self.avatarImage.image = avatarImage
        self.userName.text = userName
        self.date.text = date
        self.descripcion.text = descripcion
        
    }
    
    static func estimateRowHeight() -> CGFloat {
        return 120.0
    }
    
}
