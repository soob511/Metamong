$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    

   $(".btn-reset").on("click", function() {
            $("#itemForm")[0].reset(); 
   });
   
   $(".btn-load").on("click", function() {
      $.ajax({
    	  url:"/Metamong/code/codeLoad",
    	  type:"GET",
    	  success: function(data){
    		  var html = "";
    		  var count = 0;
              data.forEach(code => {
                  html += `<tr>
                  			  <td>${++count}</td>
                              <td>${code.codeNm}</td>
                  			  <td>${code.codeId}</td>
                              <td>${code.codeContent}</td>
                          </tr>`;
              });

              $('#codeList').html(html);
    	  }	  
      })
      
});


});

