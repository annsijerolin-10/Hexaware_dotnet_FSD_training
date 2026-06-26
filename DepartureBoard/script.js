// Initial Departure Data

const initialFlights = [
{
    time:"10:00",
    flight:"AI-202",
    dest:"Delhi",
    gate:"A1",
    status:"ON TIME"
},
{
    time:"10:30",
    flight:"6E-305",
    dest:"Mumbai",
    gate:"B4",
    status:"BOARDING"
},
{
    time:"11:00",
    flight:"UK-809",
    dest:"Bangalore",
    gate:"C2",
    status:"DELAYED"
},
{
    time:"11:45",
    flight:"AI-404",
    dest:"Chennai",
    gate:"D3",
    status:"ON TIME"
}
];

let flights = JSON.parse(JSON.stringify(initialFlights));

const board = document.getElementById("board");
const summary = document.getElementById("summary");
const clock = document.getElementById("clock");
const addBtn = document.getElementById("addBtn");
const resetBtn = document.getElementById("resetBtn");




function getStatusClass(status){

    if(status==="ON TIME")
        return "green";

    else if(status==="BOARDING")
        return "blue";

    else if(status==="DELAYED")
        return "red";

    else if(status==="GATE CLOSED")
        return "orange";

    else
        return "gray";

}




function createRow(flight){

    const row=document.createElement("div");
    row.className="row";

    const time=document.createElement("div");
    time.textContent=flight.time;

    const flightNo=document.createElement("div");
    flightNo.textContent=flight.flight;

    const destination=document.createElement("div");
    destination.textContent=flight.dest;

    const gate=document.createElement("div");
    gate.textContent=flight.gate;

    const status=document.createElement("div");
    status.textContent=flight.status;
    status.className=getStatusClass(flight.status);

   
    flight.statusCell = status;

    row.appendChild(time);
    row.appendChild(flightNo);
    row.appendChild(destination);
    row.appendChild(gate);
    row.appendChild(status);

    return row;

}

function renderBoard(){

    board.innerHTML="";

    flights.forEach(function(flight){

        const row=createRow(flight);
        board.appendChild(row);

    });

    updateSummary();

}


function updateSummary(){

    const total=flights.length;

    const boarding=flights.filter(function(f){
        return f.status==="BOARDING";
    }).length;

    const delayed=flights.filter(function(f){
        return f.status==="DELAYED";
    }).length;

    summary.textContent=
    `${total} Departures • ${boarding} Boarding • ${delayed} Delayed`;

}



function updateClock(){

    const now=new Date();

    clock.textContent=now.toLocaleTimeString();

}

setInterval(updateClock,1000);
updateClock();




addBtn.addEventListener("click",function(){

    flights.push({

        time:"12:30",
        flight:"SG-111",
        dest:"Hyderabad",
        gate:"E5",
        status:"ON TIME"

    });

    renderBoard();

});



resetBtn.addEventListener("click",function(){

    flights=JSON.parse(JSON.stringify(initialFlights));

    renderBoard();

});


const statusFlow=[
"ON TIME",
"BOARDING",
"GATE CLOSED",
"DEPARTED"
];

setInterval(function () {

    const index = Math.floor(Math.random() * flights.length);

    const flight = flights[index];

    const current = flight.status;

    const next = statusFlow.indexOf(current);

    if (next < statusFlow.length - 1) {

        flight.status = statusFlow[next + 1];
        flight.statusCell.textContent = flight.status;
        flight.statusCell.className = getStatusClass(flight.status);
        updateSummary();
    }

}, 4000);

renderBoard();