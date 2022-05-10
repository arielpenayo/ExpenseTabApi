usuarioAsesoradoExt = require('../models').usuarioAsesoradoExt;

module.exports = {
    //Get by id
    findByPk(req, res) {
        usuarioAsesoradoExt.findByPk(req.params.id)
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    findAll(req, res) {
        usuarioAsesoradoExt.findAll()
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Create
    
    findAllByFilter(req, res) {
        // console.log(req.body);
        usuarioAsesoradoExt.findAll({where: req.body})
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
};