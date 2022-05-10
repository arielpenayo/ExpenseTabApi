module.exports = function (sequelize, DataTypes) {
	var usuarioAsesorado = sequelize.define("usuarioAsesorado", {
		usuarioAsesoradoId: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement:true
		},
        asesoradorId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        asesoradoId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        usuarioAsesoradoEstado: {
            type: DataTypes.TINYINT,
            allowNull: false
        },
	}, {
		tableName: "usuario_asesorado",
		timestamps: false,
	});
	usuarioAsesorado.removeAttribute('id');
	return usuarioAsesorado;
};
