'use strict';

/**
 *  Game of Life
 *  Author(s): Nandigam and Chandler Scott
 */

/*
 * Requires "readline-sync" package for synchronous I/O
 * Package installation: npm install readline-sync
 * 		(run this command inside the project folder; requires node.js)
 * Documentation: https://www.npmjs.com/package/readline-sync
 */
const readlineSync = require('readline-sync');

/*
 * The "fs" module provides an API for interacting with the file system
 */
const fs = require('fs');//allows us to use fs funtions

// Class that represents Game of Life
class GameOfLife {

	// Constructor that sets up instance variables with default values
	constructor() {
		this.grid = [];
		this.rows = 0;
		this.cols = 0;
	}

	// Reads data from the file, instantiates the grid, and loads the
	// grid with data from file. Sets this.grid, this.rows, and
	// this.cols instance variables for later use.

  //fs.readFileSync reads the file for us until the end of the file also while
  //reading the file the program does not reach the code below it.
	loadGrid(file) {
		let data = fs.readFileSync(file, 'utf8');//reads the file for us
    //splits the data into an array of substrings based on separator specified
    //and returns them in an array, in this case the array is called tokens
    let tokens = data.split(' ');
    //attempts to extract an integer value from the string values
    //of tokens first element and reads it in as an integer value
    //but also removes it from tokens, this is done again to read the
    //second value from tokens as cols. Tokens[0]=rows; tokens[1] = cols;
		this.rows = parseInt(tokens.shift());//grabs size of rows
		this.cols = parseInt(tokens.shift());//grabs size of cols
    //creates a new array of this.rows
		this.grid = new Array(this.rows);
		for (let i = 0; i < this.rows; i++) {
      //creates an array of arrays to form a grid of this.rows,this.cols
			this.grid[i] = new Array(this.cols);
      //fills the grid from beginning to end with static value of 0
			this.grid[i].fill(0);
		}

		// TO DO: fill this.grid with values in the tokens arrays
      for(let i = 0; i < this.rows; i++){
        for(let j = 0; j < this.cols; j++){
          this.grid[i][j] = parseInt(tokens.shift());
        }
      }
	}

	// Saves the current grid values to the file specified.
	saveGrid(file) {
		let data = this.rows + ' ' + this.cols;

		// TO DO: append the values in this.grid to data
    for(let i = 0; i < this.rows; i++){
      for(let j = 0; j < this.cols; j++){
        data += " " + this.grid[i][j];
      }
    }
		data += '\n';
		fs.writeFileSync(file,data);
	}

  // Returns the number of neighbors for cell at this.grid[i][j]
	getNeighbors(i, j) {
		let neighbors = 0;
    // This section checks above the cell
    //checks up left
    if (i-1 >= 0 && j-1 >= 0 && this.grid[i-1][j-1] > 0){
        neighbors++;
    }
    //checks up
    if (i-1 >= 0 && this.grid[i-1][j] > 0){
        neighbors++;
    }
    //checks up right
    if (i-1 >= 0 && j+1 < this.cols && this.grid[i-1][j+1] > 0){
        neighbors++;
    }
    // This section checks the right and left neighbors
    //checks left
    if (j-1 >= 0 && this.grid[i][j-1] > 0){
        neighbors++;
    }
    //checks right
    if (j+1 < this.cols && this.grid[i][j+1] > 0){
        neighbors++;
    }
    //This section checks below the cell
    //checks down left
    if (i+1 < this.rows && j-1 >= 0 && this.grid[i+1][j-1] > 0){
        neighbors++;
    }
    //checks down
    if (i+1 < this.rows && this.grid[i+1][j] > 0){
        neighbors++;
    }
    //checks down right
    if (i+1 < this.rows && j+1 < this.cols && this.grid[i+1][j+1] > 0){
        neighbors++;
    }
		return neighbors;
	}

	// Mutates the grid to next generation
	mutate() {
		// make a copy of grid and fill it with zeros
		let temp = new Array(this.rows);
		for (let i = 0; i < this.rows; i++) {
			temp[i] = new Array(this.cols);
			temp[i].fill(0);
		}

    for (let i = 0; i < this.rows; i++) {
        for (let j = 0; j < this.cols; j++) {
          //"getNeighbors is not defined"
            let liveNeighbor = this.getNeighbors(i, j);
            //a cell with less than 2 live neighbors dies
            if (this.grid[i][j] !== 0 && liveNeighbor < 2) {
                temp[i][j] = 0;
            }
                //a cell with 2 or 3 live neighbors lives
            else if (this.grid[i][j] !== 0 && (liveNeighbor === 2 || liveNeighbor === 3)) {
                temp[i][j] = 1;
            }
                //a cell with greater than 3 live neighbors dies
            else if (this.grid[i][j] !== 0 && liveNeighbor > 3) {
                temp[i][j] = 0;
            }
                // a dead cell with 3 live neighbors becomes live(gets birthed)
            else if (this.grid[i][j] === 0 && liveNeighbor === 3) {
                temp[i][j] = 1;
            }
        }
    }
		// set this.grid to temp grid
		this.grid = temp;
	}

	// Returns a string representation of the grid (for display purposes)
	toString() {
		let str = '\n';
		for (let i = 0; i < this.rows; i++) {
			for (let j = 0; j < this.cols; j++) {
				if (this.grid[i][j] === 0) {
					str += ' . ';
				} else {
					str += ' X ';
				}
			}
			str += "\n";
		}
		return str;
	}
}

// Main driver for the program
function main() {
	// process.argv array stores command-line arguments
	if (process.argv.length !== 3) {
		console.log("Incorrect number of arguments to the program");
		console.log("Usage: node GameOfLife.js inputfilename");
		console.log("Example: node GameOfLife.js blinker.gol");
		process.exit(1);
	}

	// instantiate GameOfLife object
	let gol = new GameOfLife();

	// load grid with data from file given on command line
  //the parameter passed into this load grid argument is
  //the filename and is argument 2
	gol.loadGrid(process.argv[2]);

	console.log("Beginning with grid size " + gol.rows + "," + gol.cols);
	console.log(gol.toString());

	// play game
	while (true) {
		let line = readlineSync.question("Press n (or return) for next generation, i to iterate multiple times,\n"
							+ "w to save grid to disk, or q to quit? ");
		line = line.trim().toLowerCase();

		switch (line) {
			case "n":
			case "":
				gol.mutate();
				console.log(gol.toString());
				break;

			case "i":
				let num = parseInt(readlineSync.question("How many iterations? "));
				for (let i = 0; i < num; i++) {
					gol.mutate();
					console.log(gol.toString());
				}
				break;

			case "w":
				let filename = readlineSync.question("Enter a filename: ");
				gol.saveGrid(filename.trim());
				console.log("Grid saved to file " + filename + "\n");
				break;

			case "q":
				console.log("Exiting program");
				process.exit(0);
				break;
		}
	}
}

// Invoke the driver
//main();

 module.exports = GameOfLife;
