usuarioAsesorado = require('../models').usuarioAsesorado;

module.exports = {
    //Get by id
    findByPk(req, res) {
        usuarioAsesorado.findByPk(req.params.id)
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    findAll(req, res) {
        usuarioAsesorado.findAll()
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Create
    create(req, res) {
        usuarioAsesorado.create(req.body)
        .then(function(result) {
            res.status(200).send(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    //Edit
    update(req, res) {
        usuarioAsesorado.update(req.body, {
            where: {
                usuarioAsesoradoId: req.params.id
            }
        })
        .then(function(result) {
            usuarioAsesorado.findByPk(req.params.id)
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
        usuarioAsesorado.destroy({
            where: {
                usuarioAsesoradoId: req.params.id
            }
        })
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
    findAllByFilter(req, res) {
        // console.log(req.body);
        usuarioAsesorado.findAll({where: req.body})
        .then(function(result) {
            res.status(200).json(result);
        })
        .catch(function(err) {
            res.status(500).json(err);
        });
    },
};