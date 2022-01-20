//
//  File.swift
//  
//
//  Created by David Malicke on 1/20/22.
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        // /users
        let users = routes.grouped("users")
        // /users
        users.get(use: index)
        // /users POST
        users.post(use: create)
        
        // users/23
        users.group(":userId") { user in
            user.get(use: show)
        }
        
    }
    
    // /users
    func index(req: Request) throws -> String {
        return "INDEX"
    }
    
    func create(req: Request) throws -> String {
        return "CREATE"
    }
    
    func show(req: Request) throws -> String {
        guard let userId = req.parameters67
                .get("userId") as String? else {
            throw Abort(.badRequest)
        }
        return "\(userId)"
        
    }
    
    
}
