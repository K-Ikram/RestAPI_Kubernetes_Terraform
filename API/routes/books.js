const express = require('express');
const Book = require('../models/Book');
const router = express.Router();
const book = require('../models/Book')

// get a specific book
router.get('/:bookId', async (req,res) => {

        try{
            const book = await Book.findById(req.params.bookId);

            res.json(book);

        }catch(err){
            res.json({message: err});
        }

});

// update a specific book
router.patch('/:bookId', async (req,res)=>{
    try{
        const updatedbook = await Book.updateOne(
            {_id: req.params.bookId}, 
            {$set:{title: req.body.title, description: req.body.description, author: req.body.author}}
        );
        res.json(updatedbook);

    }catch(err){
        res.json({message: err});

    }
});

// delete a specific book
router.delete('/:bookId', async (req,res) =>{
    try{

        const removedbook = await Book.remove({ _id : req.params.bookId});
        res.json(removedbook);
    }catch(err){
        res.json({message: err})
    }
});



// get all the books
router.get('/', async (req,res) => {
    
    try{

        const books = await Book.find();
        res.json(books);
    }catch(err){
        res.json({message: err});
    }
});


router.post('/', async (req,res) => {
    const post = new Book({
        title : req.body.title,
        description: req.body.description,
        author:req.body.author
    });
    try{
        const savedBook =  await post.save();
        res.json(savedBook);
    }catch(err){
        res.json({message: err});
    }

    

});


module.exports = router;