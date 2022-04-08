module.exports = function (sequelize, DataTypes) {
	var usuarioCuenta = sequelize.define("usuarioCuenta", {
		usuarioCuentaId: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement:true
		},
		usuarioCuentaDescripcion: {
			type: DataTypes.TEXT,
			allowNull: false
		},
        usuarioId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
	}, {
		tableName: "usuario_cuenta",
		timestamps: false,
	});
	usuarioCuenta.removeAttribute('id');
	return usuarioCuenta;
};
