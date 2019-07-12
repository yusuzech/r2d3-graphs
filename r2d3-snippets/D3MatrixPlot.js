// !preview r2d3 data=matrix(c(1,1,0,1,0,0,1,1,0,1,1,1,1,1,1,0),nrow = 4,ncol = 4,byrow = TRUE),options = list("rect.margin" = "20%","rect.fill"="red")
var parameter = {
    margin:{
        top:"5%",
        bottom:"5%",
        left:"5%",
        right:"5%"
    },
// User shouldn't change svg width and height here, instead use width and height argument provided by r2d3
    svg:{
        width: width,
        height: height
    },
    rect:{
        fill:"rgb(135, 206, 235)",
        margin:"5%"
    }
};
//  user modified parameters from options argument
if(options !== null){
    Object.entries(options).forEach(function(entry){
        if(typeof(entry[1]) ===  "string"){
            entry[1] = "'" + entry[1] + "'";
        }
    eval("parameter."+entry[0]+"="+String(entry[1]));
});
}

var margin = {
    top:parameter.svg.height * (parseFloat(parameter.margin.top)/100),
    bottom:parameter.svg.height *(parseFloat(parameter.margin.bottom)/100),
    left:parameter.svg.width *(parseFloat(parameter.margin.left)/100),
    right:parameter.svg.width *(parseFloat(parameter.margin.right)/100)
};

//   Create graphs
var width = parameter.svg.width - margin.left - margin.right;
var height = parameter.svg.height - margin.top - margin.bottom;
// get rect width and height
var data_dim = {x:data[0].length,y:data.length};
var rect_width = width/data_dim.x; 
var rect_height = height/data_dim.y; 
    // Convert data to [{x,y,value}] format
var rows = [];
for(var j = 0;j < data.length;j++){
    for(var i = 0;i < data[j].length;i++){
        if(data[j][i] == 1){
            rows.push({"x": i* rect_width,
                "y": j* rect_height,
                "value":data[j][i]});
        }
    }
}

svg
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", `translate(${margin.left},${margin.top})`);

svg.selectAll("rect")
    .data(rows)
    .enter()
    .append("rect")
    .attr("x",function(d){return d.x})
    .attr("y",function(d){return d.y})
    .attr("width",rect_width*(1-parseFloat(parameter.rect.margin)/100))
    .attr("height",rect_height*(1-parseFloat(parameter.rect.margin)/100))
    .style("fill",parameter.rect.fill);
    