function titleize (names, cb) {
    let arr = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    cb(arr)
};

titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
});


function Elephant(name, height,tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;

    this.trumpet = function (){
        console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"`);
    };
    this.grow = function () {
        this.height = this.height + 12;
    };
    this.addTrick = function (trick){
        this.tricks.push(trick);
    };
    this.play = function () {
        return `${this.name} is ${this.tricks[Math.floor(Math.random() * this.tricks.length)]}`
    };
};


Elephant.prototype.paradeHelper = function() {
    console.log(`${this.play()} by!`);
};


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(elep => elep.paradeHelper())

function dinerBreakfast () {
    let order = ["I'd like cheesy scrambled eggs"];
    return function(food){
        order.push(food);
        return `I'd like ${order.join(' and ')} please`
    };
    
};

let bfastOrder = dinerBreakfast();
console.log(bfastOrder("chocolate chip pancakes"));
console.log(bfastOrder("grits"));
