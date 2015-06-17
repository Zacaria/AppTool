'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PrositSchema = new Schema({
    name : String,
    info : String,
    title: String,
//    content:[{
//        sectionName: String,
//        sectionContent:[{
//
//        }]
//    }],
    roles:{
        animator: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        secetary: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        }
    },
    keywords:[{
        word:String,
        defintion: String
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
    active: Boolean
});

module.exports = mongoose.model('Prosit', PrositSchema);