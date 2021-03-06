module.exports = function (sequelize, DataTypes) {
	var transaccion = sequelize.define("transaccion", {
		transaccionId: {
			type: DataTypes.INTEGER.UNSIGNED,
			
			primaryKey: true,
			autoIncrement: true,
		},
		categoriaId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		transaccionMonto: {
			type: DataTypes.DECIMAL(14, 2),
			allowNull: false,
		},
		transaccionFecha: {
			type: DataTypes.DATE,
			allowNull: false,
		},
		usuarioId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		usuarioCuentaId: {
			type: DataTypes.INTEGER,
		},
		transaccionObservacion: {
			type: DataTypes.TEXT,
		},
	}, {
		tableName: "transaccion",
		timestamps: false,
	});
	transaccion.removeAttribute('id');
	return transaccion;
};
