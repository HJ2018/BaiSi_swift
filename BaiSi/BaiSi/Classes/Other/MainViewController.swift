import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addChildViewControllers()
    }

    func addChildViewControllers() {
        
    
        /// 1.获取json文件路径
        let jsonPath = Bundle.main.path(forResource: "MainVCSettings", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonPath!)
        
        do{
            let dictArray = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            let model = ModelDecoder.decode(TabBarModel.self, array: dictArray as! [[String : Any]])
        
            model?.forEach({ (model) in
                addChildViewController(childControllerName:model.vcName!, title: model.title!, tabBarImage: model.tabBar!,tabBarImageClick: model.tabBarClick!)
            })
        }
        catch{}
    }
    
    
    func addChildViewController(childControllerName: String, title:String, tabBarImage:String, tabBarImageClick:String) {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass = NSClassFromString(namespace + "." + childControllerName)!
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: tabBarImage)
        vc.tabBarItem.selectedImage = UIImage(named: tabBarImageClick)
        let nav = UINavigationController()
        nav.addChild(vc)
        addChild(nav)
        
    }
    
}


struct ModelDecoder {
    
    public static func decode<T>(_ type: T.Type, param: [String:Any]) ->T? where T:Decodable{
       
        guard let jsonData = self.getJsonData(with: param) else {
           return nil
           
       }
        guard let model = try?JSONDecoder().decode(type, from: jsonData) else {
            return nil
        }
       return model
    }
    
    public static func decode<T>(_ type:T.Type, array: [[String:Any]]) -> [T]? where T: Decodable {
        guard let data = self.getJsonData(with: array) else {
            return nil
        }
        guard let models = try? JSONDecoder().decode([T].self, from: data) else {
            return nil
        }
        return models
    }
    
    public static func getJsonData(with param: Any) ->Data?{
        
        if !JSONSerialization.isValidJSONObject(param) {
            return nil
        }
        guard let data = try? JSONSerialization.data(withJSONObject: param, options: [])  else {
            return nil
        }
        return data
        
    }

}
