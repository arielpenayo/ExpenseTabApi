module.exports = function (sequelize, DataTypes) {
	var transaccionExt = sequelize.define("transaccionExt", {
		transaccionId: {
			type: DataTypes.INTEGER.UNSIGNED,
			
			primaryKey: true,
			autoIncrement: true,
		},
		categoriaId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		categoriaDenominacion: {
			type: DataTypes.TEXT,
			allowNull: false
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
		usuarioNombreApellido: {
			type: DataTypes.STRING(200),
			allowNull: false,
		},
	}, {
		tableName: "transaccionext",
		timestamps: false,
	});
	transaccionExt.removeAttribute('id');
	return transaccionExt;
};
