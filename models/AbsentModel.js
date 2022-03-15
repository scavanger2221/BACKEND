import { Sequelize } from "sequelize";
import db from '../config/database.js';
import User from "./UserModel.js";

const {DataTypes} =  Sequelize; 

const Absent = db.define('absent', 
    {
        userId : {
            type : DataTypes.BIGINT,
        },
        status : {
            type : DataTypes.INTEGER,
        },
        date : {
            type : DataTypes.DATE(6)
        },
        description : {
            type : DataTypes.TEXT            
        },
        shift : {
            type : DataTypes.ENUM('morning', 'evening', 'night'),
        }
        
        // tidak perlu menambahkan created_at atau updated at karena sudah otomatis 
    }, 
    {
        timestamps: false,
        paranoid: false,
        freezeTableName : true //ini agar anam db sama dengan nama ini 
    }
);
Absent.belongsTo(User);

export default Absent;