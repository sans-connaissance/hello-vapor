import Vapor

func routes(_ app: Application) throws {
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
    
}
