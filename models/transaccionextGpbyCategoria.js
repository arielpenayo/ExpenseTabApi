module.exports = function (sequelize, DataTypes) {
	var transaccionextGpbyCategoria = sequelize.define("transaccionextGpbyCategoria", {
		
		categoriaId: {
			type: DataTypes.INTEGER,
		},
		categoriaDenominacion: {
			type: DataTypes.TEXT,
		},
		transaccionMonto: {
			type: DataTypes.DECIMAL(14, 2),
		},
		usuarioId: {
			type: DataTypes.INTEGER,
		},
		transaccionFechaMes: {
			type: DataTypes.INTEGER,
		},
		transaccionFechaAnho: {
			type: DataTypes.INTEGER,
		},
		categoriaEstado: {
            type: DataTypes.TINYINT,
            allowNull: true
		},
	}, {
		tableName: "transaccion_gpby_categoria",
		timestamps: false,
	});
	transaccionextGpbyCategoria.removeAttribute('id');
	return transaccionextGpbyCategoria;
};
