module.exports = function (sequelize, DataTypes) {
	var transaccionExt = sequelize.define("transaccionExt", {
		transaccionId: {
			type: DataTypes.INTEGER.UNSIGNED,
			
		},
		categoriaId: {
			type: DataTypes.INTEGER,
		},
		categoriaDenominacion: {
			type: DataTypes.TEXT,
		},
		transaccionMonto: {
			type: DataTypes.DECIMAL(14, 2),
		},
		transaccionFecha: {
			type: DataTypes.DATE,
		},
		usuarioId: {
			type: DataTypes.INTEGER,
		},
		usuarioNombreApellido: {
			type: DataTypes.STRING(200),
		},
		transaccionFechaMes: {
			type: DataTypes.INTEGER,
		},
		categoriaEstado: {
            type: DataTypes.TINYINT,
            allowNull: true
		},
		transaccionObservacion: {
			type: DataTypes.TEXT,
		},
	}, {
		tableName: "transaccionext",
		timestamps: false,
	});
	transaccionExt.removeAttribute('id');
	return transaccionExt;
};
