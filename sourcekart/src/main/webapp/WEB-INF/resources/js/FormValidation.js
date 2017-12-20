$(function() 
{
	$("#loginForm").validate({
		rules : {
			email : {
				required : true
			},
			password : {
				required : true
			}
		},
		messages : {
			email : {
				required : "Please enter email"
			},
			password : {
				required : "Please enter password"
			}
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#registerForm").validate({
		rules : {
			name : {
				required : true
			},
			email : {
				required : true,
				email : true
			},
			
			phone : {
				required : true,
				minlength : 10,
				maxlength : 10
			},
			password : {
				required : true,
				minlength : 5,
				maxlength : 15
			},
			
			address : {
				required : true
			},
			country : {
				required : true
			}
		},
		messages : {
			name : {
				required : "Please enter your name"
			},
			email : {
				required : "Please enter your email",
				email : "Please enter valid email"
			},
			
			
			phone : {
				required : "Please enter phone",
				minlength : "Please enter valid 10 digit mobile number",
				maxlength : "Please enter valid 10 digit mobile number"
			},
			password : {
				required : "Please enter password",
				minlength : "Your password must between 5 and 15 characters",
				maxlength : "Your password must between 5 and 15 characters"
			},
			address : {
				required : "Please enter your address"
			},
			country : {
				required : "Please enter your country"
			}
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#categoryForm").validate({
		rules : {
			catDesc : {
				required : true
			},
			catName : {
				required : true
			}
			
		},
		messages : {
			catDesc : {
				required : "Please enter category Id"
			},
			catName : {
				required : "Please enter category name"
			}
			
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#supplierForm").validate({
		rules : 
		{
			supplierId :
			{
				required:true
			},
			supplierName :
			{
				required : true
			},
			supplierAddress :
			{
				required : true
			}
			
		},
		messages :
		{
			supplierId :
			{
				required:"Please enter supplier id"
			},
			supplierName :
			{
				required : "Please enter supplier name"
			},
			supplierAddress : 
			{
				required : "Please enter supplier Address"
			}
		},
		submitHandler: function(form)
		{
			form.submit();
		}
		
		
	});
	
	$("#productForm").validate({
		rules : {
			productName : {
				required : true
			},
			productDesc : {
				required : true
			},
			price : {
				required : true,
				digits : true,
				min : 1
			},
			stock : {
				required : true,
				digits : true,
				min : 1
			},
			catId: {
				required:true
	        },
	        supplierId: {
				required: true
	        },
	        pimage :{
	        	required : true
	        }
			
		},
		messages : {
			productName : {
				required : "Please enter product name"
			},
			productDesc : {
				required : "Please enter product description"
			},
			price : {
				required : "Please enter product price",
				digits: "Please enter only digits",
				min: "Please enter valid product price"
			},
			stock : {
				required : "Please enter product stock",
				digits: "Please enter only digits",
				min: "Please enter valid product stock"
			},
			catId : {
				required : "Please enter the category id"
			},
			supplierId : {
				required : "Please enter the supplier id"
			},
			pimage : {
				required : "Please add image"
			}
			
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	
	/*$("#shippingaddressForm").validate({
		rules : 
		{
			cardnum :
			{
				required:true
			},
			cardname :
			{
				required : true
			},
			month :
			{
				required : true
			},
			
			year :
			{
				required : true
			},
			
			cvv:
			{
				required : true
			}
			
		},
		messages :
		{
			cardnum :
			{
				required:"Please Enter Card Number"
			},
			cardname :
			{
				required : "Please Enter your name"
			},
			month : 
			{
				required : "Please Enter Month"
			},
		
		
			year : 
		{
			required : "Please Enter year"
		},
		
		cvv:
		{
			required : "Please Enter cvv Number"
		}
	},
		
		submitHandler: function(form)
		{
			form.submit();
		}
		
		
	});*/
	
	
	
	
	
	
	
	
	
	
});
