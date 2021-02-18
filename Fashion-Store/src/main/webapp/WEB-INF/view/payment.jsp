<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
	<%@ include file="header.jsp"%>
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<strong class="text-black">${prod.name}</strong>
				</div>
			</div>
		</div>
	</div>
	<sf:form action="/Fashion-Store/bookProd/payment" method="post"
		modelAttribute="form">
		<div class="site-section">
			<div class="container">
				
				
				<div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Payment</h2>
            
          </div>
          <div class="col-md-7">

			
		
              
              <div class="p-3 p-lg-5 border">
              
               
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Card No<span class="text-danger">*</span></label>
                    <input type="text" class="form-control"  name="email" placeholder="Enter Card No" 
                    value="" >
                   
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Card Holder Name<span class="text-danger">*</span></label>
                    <input type="text" class="form-control"  name="email" placeholder="Enter Card Holder Name" 
                    value="" >
                  </div>
                </div>
               
               <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Month<span class="text-danger">*</span></label>
                    <input type="text" class="form-control"  name="email" placeholder="Enter Month" 
                    value="" >
                   
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Year<span class="text-danger">*</span></label>
                    <input type="text" class="form-control"  name="email" placeholder="Enter Year" 
                    value="" >
                   
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">CVV<span class="text-danger">*</span></label>
                    <input type="text" class="form-control"  name="email" placeholder="Enter CVV" 
                    value="" >
                   
                  </div>
                </div>
                 
                
               
				

                
                <div class="form-group row">
                  <div class="col-lg-6">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" name="operation" value="Confirm Payment">
                  </div>
                
                </div>
              </div>
          
          </div>
			</div>
		</div>
	</sf:form>
</div>
