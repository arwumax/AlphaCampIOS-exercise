var express = require('express'),
    app = express();

var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({
    extended: true
})); // support encoded bodies

//Express 3
//app.configure(function() {
//    app.use(express.static(__dirname, '/'));
//});

//Express 4
//app.use(express.static(__dirname, '/'));

app.route('/customers')
    .get(function (req, res) {
        res.json(customers);
    });

app.route('/customer')
    .get(function (req, res) {

        var customerId = req.query.id;

        var data = {};
        for (var i = 0, len = customers.length; i < len; i++) {
            if (customers[i].id == customerId) {
                data = customers[i];
                break;
            }
        }
        res.json(data);
    }).post(function (req, res) {

        var customer = {
            id: guid(),
            name: req.body.name,
            joined: Math.floor(new Date().getTime() / 1000),
            image_url: req.body.image_url,
            city: req.body.city,
            phone: req.body.phone
        }

        customers.push(customer);

        res.json({
            status: true
        })
    })
    .put(function (req, res) {

        var customerId = req.body.id;
        var name = req.body.name;

        var data = {
            status: false
        };

        for (var i = 0, len = customers.length; i < len; i++) {
            if (customers[i].id == customerId) {
                customers[i].name = name;
                data.status = true;
                break;
            }
        }
        res.json(data);

    }).delete(function (req, res) {

        var customerId = req.body.id;

        var data = {};

        for (var i = 0, len = customers.length; i < len; i++) {
            if (customers[i].id == customerId) {
                customers.splice(i, 1);
                data = {
                    status: true
                };
                break;
            } else {
                data.status = false;
                data.message = "user doesn't exist"
            }
        }
        res.json(data);
    });

//app.delete('/customers/:id', function (req, res) {
//
//    var customerId = parseInt(req.params.id);
//
//    var data = {
//        status: false
//    };
//
//    for (var i = 0, len = customers.length; i < len; i++) {
//        if (customers[i].id === customerId) {
//            customers.splice(i, 1);
//            data = {
//                status: true
//            };
//            break;
//        }
//    }
//    res.json(data);
//});
app.listen(8080);
console.log('Express listening on port 8080');

//Model

var customers = [
    {
        id: 1,
        name: 'Mary',
        joined: '1449398713',
        image_url: 'http://i.imgur.com/X4tgg4X.jpg',
        city: 'Chandler',
        phone: '0911-222-333'
            },
    {
        id: 2,
        name: 'Cindy',
        joined: '1449062809',
        image_url: 'http://i.imgur.com/MgEWE36.jpg',
        city: null,
        phone: '0922-123-345'
            },
    {
        id: 3,
        name: 'Tina',
        joined: '1448854533',
        image_url: 'http://i.imgur.com/GyUxurL.jpg',
        city: 'New York',
        phone: '0941-113-332'
            },
    {
        id: 4,
        name: 'Alan',
        joined: '1448167168',
        image_url: 'http://i.imgur.com/VTqLY8n.jpg',
        city: null,
        phone: '0921-232-115'
            }
        ];

//Helper functions

function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
}