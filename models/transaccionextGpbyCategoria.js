module.exports = function (sequelize, DataTypes) {
	var transaccionextGpbyCategoria = sequelize.define("transaccionextGpbyCategoria", {
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
	}, {
		tableName: "transaccion_gpby_categoria",
		timestamps: false,
	});
	transaccionextGpbyCategoria.removeAttribute('id');
	return transaccionextGpbyCategoria;
};
