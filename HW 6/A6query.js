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

// 1.	Using the single collection method count, return the number of companies whose founded_year is before the year of 1980 and category_code is “music”.
db.CS301.count({ founded_year: { $lt: 1980 }, category_code: "music" });

// 2.	List the name, founded_year, number_of_employees and total_money_raised for the companies whose founded_year is after 2000 and whose number_of_employees is greater than or equal to 1000. Order the result by founded_year in ascending order, and for the companies with the same founded_year, order them by number_of_employees in descending order.
db.CS301.find({ founded_year: { $gt: 2000 }, number_of_employees: { $gte: 1000 } }, { name: 1, founded_year: 1, number_of_employees: 1, total_money_raised: 1, _id: 0 }).sort({ founded_year: 1, number_of_employees: -1 });

// 3.	List the name and founded_year for the companies whose founded_year was before 1805 or whose founded_year was after 2012.
db.CS301.find({ $or: [{ founded_year: { $lt: 1805 } }, { founded_year: { $gt: 2012 } }] }, { name: 1, founded_year: 1, _id: 0});

// 4.	For the companies with their founded_year equal to 1800 and that have at least one named product, list their name, homepage_url, number_of_employees and product names, using the find method.
db.CS301.find({ founded_year: 1800, products: { $exists: true, $ne: [] } }, { name: 1, homepage_url: 1, number_of_employees: 1, 'products.name': 1, _id: 0 });

// 5.	Write the previous query using the aggregate method.
db.CS301.aggregate([ { $match: { founded_year: 1800, products: { $exists: true, $ne: [] } } }, { $project: { name: 1, homepage_url: 1, number_of_employees: 1, 'products.name': 1, _id: 0 } } ]);

// 6.	List the maximum number_of_employees over all companies. Try to answer using both sort and aggregate methods, but enter only one answer here.
db.CS301.find({}, { number_of_employees: 1, name: 1, _id: 0 }).sort({ number_of_employees: -1 }).limit(1);

// 7.	For the companies that have a list of products, list their names and the number of products (name it as Num_Prod), using the aggregate method.
db.CS301.aggregate([ { $match: { products: { $exists: true, $ne: [] } } }, { $project: { name: 1, Num_Prod: { $size: "$products" }, _id: 0 } } ]);

// 8.	For each founded_year after 1990, find the maximum number_of_employees (name it as Max_Emp) among the companies that were founded in that particular year. List the result in descending order of maximum number_of_employees. Make sure to rename the _id key back to the founded_year, and to eliminate the companies with their founded_year unknown.
db.CS301.aggregate([ { $match: { founded_year: { $gt: 1990 } } }, { $group: { _id: "$founded_year", Max_Emp: { $max: "$number_of_employees" } } }, { $sort: { Max_Emp: -1 } }, { $project: { founded_year: "$_id", Max_Emp: 1, _id: 0 } } ]);
