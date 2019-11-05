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
    var inputElement = d3.select("#datetime");
    var inputValue = inputElement.property("value");
    var row = tbody.append("tr");
    var filteredData = tableData.filter(stefan => stefan.datetime === inputValue);
    //var dates = filteredData.map(stefan => stefan.datetime);
    tbody.html("");
    tbody.append("td").text(filteredData);
    console.log(filteredData);
    });