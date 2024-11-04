/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use.
use('db');

// Get the number of companies with their category_code is “software”.
db.CS301.find({category_code: "software"}).count();
// For companies whose founded_year is before 1810, list their name and founded_year, excluding the _id.
db.CS301.find({founded_year: {$lt: 1810}}, {name: 1, founded_year: 1, _id: 0});
