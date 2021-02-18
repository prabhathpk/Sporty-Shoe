<%@page import="in.co.fashion.store.entity.UserEntity"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sporty Shoes</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
<link rel="stylesheet" href="/Fashion-Store/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/Fashion-Store/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Fashion-Store/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/Fashion-Store/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/Fashion-Store/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/Fashion-Store/resources/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/Fashion-Store/resources/css/aos.css">

    <link rel="stylesheet" href="/Fashion-Store/resources/css/style.css">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>	
    
</head>
<body>
	<% UserEntity userbean=(UserEntity)session.getAttribute("userLogin");%>
   <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
            
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="#" class="js-logo-clone"> <font size="5"
          face="verdana"
          color="green"> 
             Sporty Shoes 
        </font></a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                <%if(userbean!=null){ %>
                 
               	<%if(userbean.getRoleId()==2){ %>
                  <li>
                    <a href="<c:url value = "/cart"/>" class="site-cart">
                      <span class="icon icon-shopping_cart"></span>  
                    </a>
                  </li> 
                  <%}%>
                  <li><a href="<c:url value = "/login"/>"><span class="glyphicon glyphicon-log-out"></span>LogOut</a></li>
           		   <%}else{%> 
           		   
           		   <li><a href="<c:url value = "/login"/>"><span class="glyphicon glyphicon-log-in"></span>Sign In</a></li>
           			<%}%>   
           		   
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
         	<li><a href="/Fashion-Store/welcome">Home</a></li>
          <%if(userbean!=null){ %>
           
           <%if(userbean.getRoleId()==1){ %>
            
             <li><a href="/Fashion-Store/category">Add Category</a></li>
             <li><a href="/Fashion-Store/category/search">Category List</a></li>
              <li><a href="/Fashion-Store/prod">Add Product</a></li>
              <li><a href="/Fashion-Store/prod/search">Product List</a></li>
             <li><a href="/Fashion-Store/bookProd/search">Booked List</a></li>
              
            <%}else{ %>
            <li><a href="/Fashion-Store/bookProd/search">Book Product</a></li>
            <%} %>
            <%}%>
            
           
          </ul>
        </div>
      </nav>
    </header>
