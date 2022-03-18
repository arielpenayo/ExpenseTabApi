usuario = require('../models').usuario;

module.exports = {
    
    //Get all
    findAll(req, res) {
        usuario.findAll()
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    
    //Get by id
    findByPk(req, res) {
        usuario.findByPk(req.params.id)
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Get by Filter
    findAllByFilter(req, res) {
        console.log(req.body);
        usuario.findAll({
            where: req.body,
            attributes: {
                exclude: ['usuarioContrasenha']
            }
        })
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Create
    create(req, res) {
       usuario.create(req.body)
        .then(function(result) {
            res.status(200).send(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Edit
    update(req, res) {
       usuario.update(req.body, {
            where: {
               usuarioId: req.params.id
            }
        })
        .then(function(result) {
           usuario.findById(req.params.id)
            .then(function(result) {
                res.status(200).json(result);
            })
            .catch(function(err) {
                res.status(500).json(err);
            });
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Delete
    delete(req, res) {
       usuario.destroy({
            where: {
               usuarioId: req.params.id
            }
        })
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    }
};