module.exports = function (sequelize, DataTypes) {
	var usuarioAsesoradoExt = sequelize.define("usuarioAsesoradoExt", {
		usuarioAsesoradoId: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement:true
		},
        asesoradorId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        asesoradorNombreApellido: {
            type: DataTypes.STRING(200),
            allowNull: false,
          },
        asesoradoId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        asesoradoNombreApellido: {
            type: DataTypes.STRING(200),
            allowNull: false,
          },
        usuarioAsesoradoEstado: {
            type: DataTypes.TINYINT,
            allowNull: false
        },
	}, {
		tableName: "usuario_asesorado_ext",
		timestamps: false,
	});
	usuarioAsesoradoExt.removeAttribute('id');
	return usuarioAsesoradoExt;
};
