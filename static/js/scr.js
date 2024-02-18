// document.write("Hello,World!");
// document.getElementsByClassName('bulk_a')[0].style.marginTop="20px";

function Dyna() {

    var j=88;
    var i=0;
    // var timesRun = 0;
    document.getElementsByClassName('bulk_a')[0].style.display="block";
    var interval = setInterval(function(){
    // timesRun += 1;

    document.getElementsByClassName('bulk_a')[i].style.marginTop=j+"px";
            j=j-1;
            if (j==52){
                i++;
                j=88;
                if(i<=4)document.getElementsByClassName('bulk_a')[i].style.display="block";
            }

    if(i==5){
        clearInterval(interval);
    }

    //do whatever here..
}, 7);

}//Dyna

function fadout(){


    let m=0;
    var interval = setInterval(function(){
    // timesRun += 1;
    document.getElementById('waikuai').style.opacity=m;
    m=m+0.01;
    if(m==0.7){
        m=1;
     document.getElementById('waikuai').style.opacity=m;
    }
    if(m==1){
        clearInterval(interval);
    }

    //do whatever here..
}, 25);


}



















