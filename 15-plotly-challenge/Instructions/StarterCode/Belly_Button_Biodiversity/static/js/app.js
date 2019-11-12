console.log("Hello World")
function buildMetadata(sample) {
  var table = d3.select("#sample-metadata");
  var url = `/metadata/${sample}`;
  console.log(url)
  d3.json(url).then(function (sample_metadata) {

    console.log(sample_metadata)
    var data1 = sample_metadata;

    table.html("");

    Object.entries(sample_metadata).forEach(([key, value]) => {
      table.append("h6").text(`${key}: ${value}`);
    });
  });
}

function buildCharts(sample2) {
  var sample_list = []
  var pie = d3.select("#pie");
  var bubble = d3.select("#bubble")
  var url2 = `/samples/${sample2}`;
  
  d3.json(url2).then(function (piedata) {

    pie.html("");

    Object.entries(piedata).forEach(([key, value]) => {

      const all_values = [];
      const all_keys = [];
      
      all_values.push([value]);
      all_keys.push([key]);
      
      const values = all_values.slice(0, 10);
      const keys = all_keys.slice(0,10)

      
      var data = [{
        values: values,
        labels: keys,
        type: "pie"
      }];
    
      var layout = {
        height: 600,
        width: 800
      };
    
      Plotly.plot("pie", data, layout);
    
    });
  
    d3.json(url2).then(function (bubbledata) {


    });

    // HINT: You will need to use slice() to grab the top 10 sample_values,
    // otu_ids, and labels (10 each).
  });
}



function init() {
  // Grab a reference to the dropdown select element
  var selector = d3.select("#selDataset");

  // Use the list of sample names to populate the select options
  d3.json("/names").then((sampleNames) => {
    sampleNames.forEach((sample) => {
      selector
        .append("option")
        .text(sample)
        .property("value", sample);
    });

    // Use the first sample from the list to build the initial plots
    const firstSample = sampleNames[0];
    buildCharts(firstSample);
    buildMetadata(firstSample);
  });
}

function optionChanged(newSample) {
  // Fetch new data each time a new sample is selected
  buildCharts(newSample);
  buildMetadata(newSample);
}

// Initialize the dashboard
init();
