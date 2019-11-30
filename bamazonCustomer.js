//NPM's required to run application
var mysql = require("mysql");
var inquirer = require("inquirer");

//Create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",

    // Your port
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: "pekybruno",
    database: "bamazon_DB"
});

// Connect to mysql server and sql database
connection.connect(function (err) {
    if (err) throw err;
    //Runs the display all products for same function
    displayAll();
});


// Function to diplay all products
function displayAll() {
    // Query database for all products for sale
    connection.query("SELECT * FROM products", function (err, results) {
        console.log("Welcome shopper, These are the current products available for sale!");
        if (err) throw err;
        let productArr = [];
        for (var i = 0; i < results.length; i++) {
            // console.log("===================================================================================================");
            // console.log("Product ID: " + Number(results[i].item_id), "| " + results[i].product_name, "| Price: " + Number(results[i].price));
            productArr.push(new Product(results[i].item_id, results[i].product_name, results[i].price));
        }
        console.table(productArr);
    });
};

// Constructor function
function Product(item_id, product_name, price) {
    this.item_id = item_id;
    this.product_name = product_name;
    this.price = price;
}