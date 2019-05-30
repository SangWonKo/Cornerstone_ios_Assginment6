//
//  TodoTableViewCell.swift
//  Assginment6
//
//  Created by 고상원 on 2019-05-02.
//  Copyright © 2019 고상원. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    let todoName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.textColor = .blue
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview(todoName)
        todoName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        todoName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
        

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
