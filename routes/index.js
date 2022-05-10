const authentication = require('../authentication/authentication');
const categoria = require('../controllers/categoria');
const transaccion = require('../controllers/transaccion');
const usuario = require('../controllers/usuario');
const transaccionExt = require('../controllers/transaccionExt');
const usuarioCuenta = require('../controllers/usuarioCuenta');
const transaccionextGpbyCategoria = require('../controllers/transaccionextGpbyCategoria');
const usuarioAsesorado= require('../controllers/usuarioAsesorado');
const usuarioAsesoradoExt= require('../controllers/usuarioAsesoradoExt');
const emailer = require('../controllers/emailer');


module.exports = function(router) 
{   
    //emailer
    router.get('/emailer', emailer.findAll);
    router.get('/emailer/:id', emailer.findById);
    router.post('/emailer-filter', emailer.findAllByFilter);
    router.post('/emailer', emailer.create);
    router.put('/emailer/:id', emailer.update);
    router.delete('/emailer/:id', emailer.delete);

    //usuarioAsesoradoExt
    router.get('/usuario-asesorado-ext', usuarioAsesoradoExt.findAll);
    router.get('/usuario-asesorado-ext/:id', usuarioAsesoradoExt.findByPk); 
    router.post('/usuario-asesorado-ext-filter', usuarioAsesoradoExt.findAllByFilter);
    //usuarioAsesorado
    router.get('/usuario-asesorado', usuarioAsesorado.findAll);
    router.get('/usuario-asesorado/:id', usuarioAsesorado.findByPk);
    router.post('/usuario-asesorado', usuarioAsesorado.create);
    router.put('/usuario-asesorado/:id', usuarioAsesorado.update);
    router.delete('/usuario-asesorado/:id', usuarioAsesorado.delete);
    router.post('/usuario-asesorado-filter', usuarioAsesorado.findAllByFilter);

    //transaccionextGpbyCategoria
    router.get('/transaccion-ext-gpby-categoria/:id', transaccionextGpbyCategoria.findByPk);
    router.post('/transaccion-ext-gpby-categoria-filter', transaccionextGpbyCategoria.findAllByFilter);
    router.get('/transaccion-ext-gpby-categoria', transaccionextGpbyCategoria.findAll);
   
    //transaccionExt
    router.get('/transaccion-ext/:id', transaccionExt.findByPk);
    router.post('/transaccion-ext-filter', transaccionExt.findAllByFilter);
    router.get('/transaccion-ext', transaccionExt.findAll);
   
    //usuarioCuenta
    router.get('/usuario-cuenta', usuarioCuenta.findAll);
    router.get('/usuario-cuenta/:id', usuarioCuenta.findByPk);
    router.post('/usuario-cuenta', usuarioCuenta.create);
    router.put('/usuario-cuenta/:id', usuarioCuenta.update);
    router.delete('/usuario-cuenta/:id', usuarioCuenta.delete);
    router.post('/usuario-cuenta-filter', usuarioCuenta.findAllByFilter);
    //usuario
    router.get('/usuario', usuario.findAll);
    router.get('/usuario/:id', usuario.findByPk);
    router.post('/usuario', usuario.create);
    router.put('/usuario/:id', usuario.update);
    router.delete('/usuario/:id', usuario.delete);
    router.post('/usuario-filter', usuario.findAllByFilter);
    //transaccion
    router.get('/transaccion', transaccion.findAll);
    router.get('/transaccion/:id', transaccion.findByPk);
    router.post('/transaccion', transaccion.create);
    router.put('/transaccion/:id', transaccion.update);
    router.delete('/transaccion/:id', transaccion.delete);
    router.post('/transaccion-filter', transaccion.findAllByFilter);
    //categoria
    router.get('/categoria', categoria.findAll);
    router.get('/categoria/:id', categoria.findByPk);
    router.post('/categoria', categoria.create);
    router.put('/categoria/:id', categoria.update);
    router.delete('/categoria/:id', categoria.delete);
    router.post('/categoria-filter', categoria.findAllByFilter);

    router.post('/authentication-login', authentication.login);

    return router;
};