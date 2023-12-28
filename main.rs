use actix_web::{web, App, HttpServer, Responder};

async fn hello() -> impl Responder {
    // ASCII art representation
    let ascii_art = r#"
         / \
        |\_/|
        |---|
        |   |
        |   |
      _ |=-=| _
  _  / \|   |/ \
 / \|   |   |   ||\
|   |   |   |   | \>
|   |   |   |   |   \
| -   -   -   - |)   )
|                   /
 \                 /
  \               /
   \             /
    \           /
    "#;

    // Return the ASCII art as the response
    ascii_art
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new().service(web::resource("/").to(hello))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
