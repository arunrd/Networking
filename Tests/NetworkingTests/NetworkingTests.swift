import XCTest
import Networking
import Combine

final class NetworkingTests: XCTestCase {
    
    var cancellable: Cancellable?
    
    func testUsagesGet() {
        let exp1 = expectation(description: "call")
        let exp2 = expectation(description: "call")
        let exp3 = expectation(description: "call")
        let exp4 = expectation(description: "call")
        let exp5 = expectation(description: "call")
        let exp6 = expectation(description: "call")
        let exp7 = expectation(description: "call")
        let exp8 = expectation(description: "call")
        let exp9 = expectation(description: "call")
    
        // Create client.
        let client = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")
        
        // Void
        client.get("/posts/1").then {
            exp1.fulfill()
        }
                
        // Data
        client.get("/posts/1").then { (data:Data) in
            exp2.fulfill()
        }
        
        // JSON
        client.get("/posts/1").toJSON().then { json in
            exp3.fulfill()
        }
        
        // Model (auto generic)
        client.get("/posts/1").then { (post: Post) in
            exp4.fulfill()
        }
        
        // Model (auto generic)
        client.get("/posts/1").then { (post: CleanPost) in
            exp5.fulfill()
        }
        
        // Model explicit
        client.get("/posts/1").toModel(Post.self).then { model in
            exp6.fulfill()
        }
        
        // Model implicit
        client.get("/posts/1").toModel().then { (model: Post) in
            exp7.fulfill()
        }
        
        // JSON (auto generic)
        client.get("/posts/1").then { (json:JSON) in
            exp8.fulfill()
        }
        
        // Model (auto generic)
        client.get("/posts/1").then { (todo: CleanPost) in
            exp9.fulfill()
        }
    
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetDecodableModel() {
        let exp = expectation(description: "call")
        let api: Api = ConcreteJSONApi()
        api.fetchPost().then { post in
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetDecodableModels() {
        let exp = expectation(description: "call")
        let api: Api = ConcreteJSONApi()
        api.fetchPosts().then { posts in
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetNonDecodableModel() {
        let exp = expectation(description: "call")
        let api: Api = ConcreteJSONApi()
        api.fetchCleanPost().then { post in
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetNonDecodableModels() {
        let exp = expectation(description: "call")
        let api: Api = ConcreteJSONApi()
        api.fetchCleanPosts().then { posts in
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    
    //delete
    func testUsagesDelete() {
        let exp1 = expectation(description: "call")
        let exp2 = expectation(description: "call")
//        let exp3 = expectation(description: "call")
//        let exp4 = expectation(description: "call")
//        let exp5 = expectation(description: "call")
//        let exp6 = expectation(description: "call")
    
        // Create client.
        var client = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")
                
        // Data
        client.delete("/posts/1").then { data in
            exp1.fulfill()
        }

        // JSON
        client.delete("/posts/1").toJSON().then { json in
            exp2.fulfill()
        }
//
//        // Model explicit
//        client.get("/posts/1").toModel(Post.self).then { model in
//            exp3.fulfill()
//        }
//
//        // Model implicit
//        client.get("/posts/1").toModel().then { (model: Post) in
//            exp4.fulfill()
//        }
//
//        // JSON (auto generic)
//        client.get("/posts/1").then { (json:Any) in
//            exp5.fulfill()
//        }
//
//        // Model (auto generic)
//        client.get("/posts/1").then { (todo: CleanPost) in
//            exp6.fulfill()
//        }
    
        waitForExpectations(timeout: 3, handler: nil)
    }

    static var allTests = [
        ("testUsagesGet", testUsagesGet),
        ("testGetDecodableModel", testGetDecodableModel),
        ("testGetDecodableModels", testGetDecodableModels),
        ("testGetNonDecodableModel", testGetNonDecodableModel),
        ("testGetNonDecodableModels", testGetNonDecodableModels),
    ]
}






