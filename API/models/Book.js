const mongoose = require('mongoose');

const BookSchema = mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    author: {
        type: String,
        required: false
    },
    description: {
        type: String,
        required: true
    },
    date: {
    type: Date,
    default: Date.now
    }
});

module.exports = mongoose.model('Books', BookSchema)