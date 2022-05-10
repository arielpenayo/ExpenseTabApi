/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
 var emailer = sequelize.define('emailer', {
    emailerId: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'emailer_id'
    },
    emailerTo: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: 'emailer_to'
    },
    emailerSubject: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: 'emailer_subject'
    },
    emailerText: {
      type: DataTypes.TEXT,
      allowNull: false,
      field: 'emailer_text'
    },
    emailerEstado: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '2',
      field: 'emailer_estado'
    }
  }, {
    timestamps: false,
    tableName: 'emailer'
  });
  emailer.removeAttribute('id');
  return emailer;
};
