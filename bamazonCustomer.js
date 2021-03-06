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
    password: "",
    database: "bamazon_DB"
});

// Connect to mysql server and sql database
connection.connect(function (err) {
    if (err) throw err;
    console.log("Welcome, these are the current products available for sale!");
    //Runs the display all products for same function
    displayAll();
});


// Function to diplay all products
function displayAll() {
    // Query database for all products for sale
    connection.query("SELECT * FROM products", function (err, results) {
        if (err) throw err;
        let productArr = [];
        for (var i = 0; i < results.length; i++) {
            productArr.push(new Product(results[i].item_id, results[i].product_name, results[i].price));
        }
        console.table(productArr);
        whichProduct();
    });
};

// Constructor function
function Product(item_id, product_name, price) {
    this.item_id = item_id;
    this.product_name = product_name;
    this.price = price;
}

// Function to ask user what product they would like to buy 
function whichProduct() {
    // Query database for all products being sold
    connection.query("SELECT *FROM products", function (err, results) {
        // Prompt user what item they would like to buy
        inquirer.prompt([
            {
                name: "buyProduct",
                type: "list",
                message: "Which item_id do you want to purchase?",
                choices: function () {
                    var choiceId = [];
                    for (var i = 0; i < results.length; i++) {
                        choiceId.push(results[i].item_id);
                    }
                    return choiceId;
                }
            },
            {
                name: "quantityProduct",
                type: "number",
                message: "How many would you like to purchase?"
            }
        ]).then(function (answer) {
            var chosenProduct;
            for (var i = 0; i < results.length; i++) {
                if (results[i].item_id === answer.buyProduct) {
                    chosenProduct = results[i];
                }
            }
            // Determine if there are still enough products in stock
            if (chosenProduct.stock_quantity > parseInt(answer.quantityProduct)) {
                connection.query("UPDATE products SET ? WHERE ?",
                    [
                        {
                            stock_quantity: chosenProduct.stock_quantity - answer.quantityProduct
                        },
                        {
                            item_id: chosenProduct.item_id
                        }
                    ],
                    function (error) {
                        if (error) throw error;
                        console.log("Successful Purchase!");
                        console.log("Your Total Due Was: " + parseFloat(answer.quantityProduct) * parseFloat(chosenProduct.price));
                        buyMore();
                    }
                );
            }
            else {
                console.log("Not enough product stock to fulfill your request, sorry!");
                buyMore();
            }
        });
    });
}

// Function to shop again
function buyMore() {
    inquirer.prompt([
        {
            name: "buyAgain",
            type: "confirm",
            message: "Would you like to buy another product?"
        }
    ]).then(function (answer) {
        if (answer.buyAgain) {
            console.log("What else may we help you with?")
            displayAll();
        }
        else {
            console.log("Thank you for giving us your business, have a great day!")
            connection.end();
        }
    });
}