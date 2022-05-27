const nodemailer = require("nodemailer");
const fetch = require('node-fetch');
var express = require('express');
var app = express();
const PORT = 8080;
app.listen(PORT);

const config = require('../config/config.json');
const environment = process.env.NODE_ENV || 'local';
const environmentConfig = config[environment];
 

const transporter = nodemailer.createTransport({
    host: "smtp.office365.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: { 
        //ACLARACION, ACA UTILIZAR UN CORREO DE 365 o DE OUTLOOK CON AUTORIZACION SMPT, DEJO EN BLANCO POR CUESTIONES DE PRIVACIDAD, PARA MAS INFORMACION https://nodemailer.com/about/
        user: "",
        pass: ""
    }
});
module.exports = {

    // async..await is not allowed in global scope, must use a wrapper
    async enviarCorreo() {
        function cambiarEstado(registroId) {
            console.log('registroId :>> ', registroId);
            const actualizacion = {
                emailerEstado: 1
            }
            fetch("http://localhost:3456/" + `emailer/${registroId}`, {
                method: 'PUT',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(actualizacion)
            })
                .then((result) => {
                    console.log("result mailer.js:42", result)
                }).catch((err) => {
                    console.log('err :>> ', err);
                    // return false;
                });
        };
        const filtro = {
            emailerEstado: 2
        }
        fetch("http://localhost:3456/" + 'emailer-filter', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(filtro)
        })
            .then(res => {
                // console.log('res 1:>> ', res);
                res.json()
                    .then(json => {
                        console.log("Emails a enviar: ", json)
                        if (json.length > 0) {
                            json.forEach(async (elemento) => {
                                console.log('Email enviado a: ', elemento.emailerTo);
                                let info = await transporter.sendMail({
                                    from: 'granartis@somaxagro.com', // sender address
                                    to: elemento.emailerTo, // list of receivers
                                    subject: elemento.emailerSubject, // Subject line
                                    text: `\n\n` + elemento.emailerText + `\n\n*** ESTE ES UN EMAIL GENERADO AUTOMÁTICAMENTE. NO RESPONDA AL MISMO ***` // plain text body
                                    // html: "<b>Hello world?</b>" // html body
                                });
                                console.log("Message sent: %s", info.messageId);
                                console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
                                cambiarEstado(elemento.emailerId)
                            });
                        } 
                        // else {
                        //     console.log('Sin emails pendientes de envio');
                        // }

                    })
                    .catch((err) => {
                        console.log('err2 :>> ', err);
                        return false;
                    })

            })

            .catch((err) => {
                console.log('err1 :>> ', err);
                return false;
            })

    }



}
