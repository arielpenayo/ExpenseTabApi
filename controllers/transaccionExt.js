transaccionExt = require('../models').transaccionExt;

module.exports = {
    //Get by id
    findByPk(req, res) {
        transaccionExt.findByPk(req.params.id)
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    findAll(req, res) {
        transaccionExt.findAll()
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    findAllByFilter(req, res) {
        console.log(req.body);
        transaccionExt.findAll({where: req.body})
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },

};