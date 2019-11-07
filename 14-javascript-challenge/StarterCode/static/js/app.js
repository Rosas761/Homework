// from data.js
var tableData = data;

// YOUR CODE HERE!

var tbody = d3.select("tbody");
var button = d3.select("#filter-btn");


data.forEach(Alien =>{
    var row = tbody.append("tr");
    Object.entries(Alien).forEach(([key,value]) => {
    row.append('td').text(value);
    });
});

button.on("click", function() {
    tbody.html("");
    var inputElement = d3.select("#datetime");
    var inputValue = inputElement.property("value");
    var filteredData = tableData.filter(thing => thing.datetime === inputValue);
    var dates = filteredData.map(thing2 => thing2.datetime);
    
    filteredData.forEach(row =>{
        var tr = tbody.append('tr')
        tr.append('td').text(row.datetime);
        tr.append('td').text(row.city);
        tr.append('td').text(row.state);
        tr.append('td').text(row.country);
        tr.append('td').text(row.shape);
        tr.append('td').text(row.durationMinutes);
        tr.append('td').text(row.comments);
    })   
});