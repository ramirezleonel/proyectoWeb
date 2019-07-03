<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
    @php

 vardump('das');
    @endphp


<input type="text" id="one" placeholder="name">
<input type="number" id="two" placeholder="age">
<input type="text" id="three" placeholder="Address">
<button onclick="add()">Add</button>
<button onclick="update()">Update</button>

<table class="table table-bordered">
<thead>
<th>Sl.No</th>
<th>Name</th>
<th>Age</th>
<th>Address</th>
<th>Action</th>
</thead>
<tbody id="data">
</tbody>

</table>

<script>
var newone=[]
var newtwo=[]
var newthree=[]

function add(){

var one=document.getElementById('one').value
var two=document.getElementById('two').value
var three=document.getElementById('three').value
newone.push(one);
newtwo.push(two);
newthree.push(three);
listshow();
}

function listshow(){
var list=""
for(var i=0;i<newone.length;i++){
list+= "<tr><td>"+(i+1)+"</td>"+"<td>"+newone[i]+"</td>"+"<td>"+newtwo[i]+"</td>"+"<td>"+newthree[i]+"</td>"+"<td>"+"<button onclick='edt("+i+")'>Edit</button><button onclick='del("+i+")'>Delete</button>"+"</td></tr>"

}
document.getElementById('data').innerHTML=list

}

var load=""
function edt(edit){
load=edit
document.getElementById('one').value=newone[edit]
document.getElementById('two').value=newtwo[edit]
document.getElementById('three').value=newthree[edit]

}

function update(){
newone[load]=document.getElementById('one').value
newtwo[load]=document.getElementById('two').value
newthree[load]=document.getElementById('three').value
listshow();

}

function del(dok){
newone.splice(dok,1)
newtwo.splice(dok,1)
newthree.splice(dok,1)
listshow();
}



</script>

</body>
</html>
