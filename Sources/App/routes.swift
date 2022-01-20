import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: UserController())
    
    //http://127.0.0.1:8080
    app.get { req in
        return "ROOT"
    }
    //http://127.0.0.1:8080/hello
    app.get("hello") { req in
        return "HELLO"
    }
    
    //http://127.0.0.1:8080/movies/year/youryear/genre/yourgenrehere
    app.get("movies", "year", ":year", "genre", ":genre" ) { req -> String in
        
        guard let genre = req.parameters.get("genre"),
              let year = req.parameters.get("year") else {
                  throw Abort(.badRequest)
              }
        
        return "the genre was \(genre) for year \(year)"
              
    }
    
    
    //http://127.0.0.1:8080/movies/genre/yourgenrehere
    app.get("movies", "genre", ":name") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.badRequest)
        }
        return "the genre was \(name)"
    }
    
    
    //    //http://127.0.0.1:8080/movies/genre/fiction
    //    app.get("movies", "genre", "fiction") { req in
    //        return "/movies/genre/fiction"
    //    }
    //
    //    //http://127.0.0.1:8080/movies/genre/comedy
    //    app.get("movies", "genre", "comedy") { req in
    //        return "/movies/genre/comedy"
    //    }
    
    // anything routes
    app.get("foo", "*", "baz") { req in
        return "FOO BAZZ"
        
    }
    
    // catchall routes
    
    app.get("foo", "**") { req in
        return "FOO"
    }
    
    //Query string
    // search?keyword=toys&page=12
    app.get("search") { req -> String in
        guard let keyword = req.query["keyword"] as String?,
              let page = req.query["page"] as Int? else {
                  throw Abort(.badRequest)
              }
        
        return "keyword = \(keyword) and page = \(page)"
        
    }
    
    //Route Groups
    // /users/12
    // /users
    // POST /users
    
//    let users = app.grouped("users")
//    
//    //users
//    users.get { req in
//        return "/users"
//    }
//    
//    //users/23
//    users.get(":userId") { req -> String in
//        guard let userId = req.parameters.get("userId") else {
//            throw Abort(.badRequest)
//        }
//        return "userId = \(userId)"
//    }
//    
//    //POST /users
//    users.post { req in
//        return "POST"
//    }
//    
}
