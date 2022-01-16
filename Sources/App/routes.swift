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
