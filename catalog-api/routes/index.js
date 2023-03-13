var express = require('express');
var router = express.Router();


router.get('/car/all', function(req, res, next) {
  var data = [
    { carId: '645fb660-d007-43d3-88d5-5d2813aa8175', carMaker: 'Fiat', carModel: 'Multipla' },
    { carId: '1ce3f6a9-e0d1-451c-be36-48b49726938c', carMaker: 'Renault', carModel: 'Clio' }
  ];

  res.send(data);
});

module.exports = router;
