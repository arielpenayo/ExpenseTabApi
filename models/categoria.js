module.exports = function (sequelize, DataTypes) {
	var categoria = sequelize.define("categoria", {
		categoriaId: {
			type: DataTypes.STRING(10),
			primaryKey: true,
			autoIncrement:true
		},
		categoriaDenominacion: {
			type: DataTypes.TEXT,
			allowNull: false
		},
        categoriaEstado: {
            type: DataTypes.TINYINT,
            allowNull: true
		},
	}, {
		tableName: "categoria",
		timestamps: false,
	});
	categoria.removeAttribute('id');
	return categoria;
};
