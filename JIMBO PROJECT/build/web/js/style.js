/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 var likeBtn = document.querySelector(".fa-heart");
 likeBtn.addEventListener('click', ToggleColor());
 function ToggleColor(){
     if(likeBtn.style.color==='white'){
         likeBtn.style.color ='red';
         
     }
     else if(likeBtn.style.color==='red'){
         likeBtn.style.color='white';
     }
 }

