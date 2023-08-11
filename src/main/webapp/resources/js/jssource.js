function listView(userid){
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'p_pno');
    obj.setAttribute('value', userid);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'getProduct.do');
    document.body.appendChild(f);
    f.submit();
}

function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'getProduct.do?p_pno=1');
    document.body.appendChild(f);
    f.submit();
}