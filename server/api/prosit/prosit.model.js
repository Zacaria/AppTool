'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PrositSchema = new Schema({
    name : String,
    info : String,
    title: String,
    roles:{
        //affect roles
        animator: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        secetary: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        //updates prosit
        scribe: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        }
    },
    keywords:[{
        word:String,
        definition: {
            type:String,
            default: 'default',
            required: true
        }
    }],
    problematic:[{
        title:String
    }],
    generalization:String,
    paths:[{
        title:String,
        answer: Boolean
    }],
    actions:[{
        title: String
    }],
    dates:{
        created:{
            type: Date,
            default: Date.now()
        },
        updated: Date,
        deleted: Date
    },
    promotion: String,
    active: Boolean
});

module.exports = mongoose.model('Prosit', PrositSchema);